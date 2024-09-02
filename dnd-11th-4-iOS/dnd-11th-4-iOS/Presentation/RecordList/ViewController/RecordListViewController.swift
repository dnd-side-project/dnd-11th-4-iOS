//
//  RecordListViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit

protocol ListDeleteDelegate: AnyObject {
    func didDeleteRecord(at indexPath: IndexPath)
}

final class RecordListViewController: UIViewController, ListDeleteDelegate {
    private let navigationBar = MDNavigationBar(type: .list)
    private var records: [Test] = []
    private var recordListView: UICollectionView!
    private let emptyRecordView = EmptyRecordView()
    
    var disposeBag: DisposeBag = DisposeBag()
    var reactor: RecordListReactor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCollectionView()
        reactor = RecordListReactor()
        bind(reactor: reactor!)
        reactor?.action.onNext(.loadRecords)
    }
    
    private func setupUI() {
        view.backgroundColor = .mapWhite
        
        navigationController?.navigationBar.isHidden = true
        view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        
        view.addSubview(emptyRecordView)
        emptyRecordView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        emptyRecordView.isHidden = true
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 32, height: 76)
        layout.minimumLineSpacing = 24
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 44)
        recordListView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.addSubview(recordListView)
        recordListView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func registerCollectionView() {
        recordListView.register(RecordListCell.self, forCellWithReuseIdentifier: RecordListCell.identifier)
        recordListView.register(RecordListHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecordListHeaderView.identifier)
        recordListView.dataSource = self
    }
    
    private func showEmptyRecordView() {
        emptyRecordView.isHidden = false
        recordListView.isHidden = true
    }
    
    private func showRecordListView() {
        emptyRecordView.isHidden = true
        recordListView.isHidden = false
    }
    
    func didDeleteRecord(at indexPath: IndexPath) {
        records.remove(at: indexPath.item)
        recordListView.deleteItems(at: [indexPath])
        
        if records.isEmpty {
            showEmptyRecordView()
        }
        
        MDToast.show(type: .delete)
    }
}

extension RecordListViewController: View {
    func bind(reactor: RecordListReactor) {
        reactor.state
            .map { $0.records }
            .subscribe(onNext: { [weak self] records in
                guard let self = self else { return }
                self.records = records
                
                if records.isEmpty {
                    self.showEmptyRecordView()
                } else {
                    self.recordListView.reloadData()
                    self.showRecordListView()
                }
            })
            .disposed(by: disposeBag)
    }
}

extension RecordListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return records.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordListCell.identifier, for: indexPath) as! RecordListCell
        cell.configure(with: records[indexPath.item])
        cell.deleteButtonTapped
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                if let index = collectionView.indexPath(for: cell) {
                    let popUpVC = ListDeleteViewController()
                    self.present(popUpVC, animated: true)
                    popUpVC.delegate = self
                    popUpVC.recordIndex = index
                }
            })
            .disposed(by: cell.disposeBag)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecordListHeaderView.identifier, for: indexPath) as! RecordListHeaderView
            headerView.setCount(records.count)
            return headerView
        }
        return UICollectionReusableView()
    }
}

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

final class RecordListViewController: UIViewController {
    private let navigationBar = MDNavigationBar(type: .list)
    private var records: [Test] = []
    private var collectionView: UICollectionView!
    
    var disposeBag: DisposeBag = DisposeBag()
    var reactor: RecordListReactor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mapWhite
        setupNavigationBar()
        setupCollectionView()
        reactor = RecordListReactor()
        bind(reactor: reactor!)
        reactor?.action.onNext(.loadRecords)
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = true
        view.addSubview(navigationBar)
        
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.frame.width - 32, height: 76)
        layout.minimumLineSpacing = 24
        layout.headerReferenceSize = CGSize(width: view.frame.width, height: 44)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RecordListCell.self, forCellWithReuseIdentifier: RecordListCell.identifier)
        collectionView.register(RecordListHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecordListHeaderView.identifier)
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        collectionView.dataSource = self
    }
}

extension RecordListViewController: View {
    func bind(reactor: RecordListReactor) {
        reactor.state
            .map { $0.records }
            .subscribe(onNext: { [weak self] records in
                guard let self = self else { return }
                self.records = records
                self.collectionView.reloadData()
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


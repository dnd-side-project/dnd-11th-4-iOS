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
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RecordListCell.self, forCellWithReuseIdentifier: RecordListCell.identifier)
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension RecordListViewController: View {
    func bind(reactor: RecordListReactor) {
        reactor.state
            .map { $0.records }
            .bind(to: collectionView.rx.items(cellIdentifier: RecordListCell.identifier, cellType: RecordListCell.self)) { index, record, cell in
                cell.configure(with: record)
            }
            .disposed(by: disposeBag)
    }
}

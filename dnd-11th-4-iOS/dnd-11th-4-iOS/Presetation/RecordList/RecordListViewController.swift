//
//  RecordListViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit
import SnapKit

final class RecordListViewController: UIViewController {
    private let navigationBar = MDNavigationBar(type: .list)
    private var records: [Test] = []
    private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mapWhite
        setupNavigationBar()
        setupCollectionView()
        loadRecords()
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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecordListCell.self, forCellWithReuseIdentifier: RecordListCell.identifier)
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(navigationBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func loadRecords() {
        // 예시 데이터 추가
        records.append(Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"))
        records.append(Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"))
        records.append(Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"))
        records.append(Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"))
        records.append(Test(image: UIImage(resource: .iconMap), title: "강릉 경주월드", memo: "꾸르잼", date: "24.10.22"))
        
        collectionView.reloadData()
    }
    
    
}


extension RecordListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return records.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordListCell.identifier, for: indexPath) as! RecordListCell
        cell.configure(with: records[indexPath.item])
        return cell
    }
}

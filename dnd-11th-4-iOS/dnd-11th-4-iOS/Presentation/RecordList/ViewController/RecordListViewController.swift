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
import RxDataSources
import ReactorKit

final class RecordListViewController: UIViewController {
    typealias Reactor = RecordListReactor
    var disposeBag = DisposeBag()
    
    // MARK: - UI Propertise
    
    private let navigationBar = MDNavigationBar(type: .list)
    private let recordListView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: Constant.Screen.width - 32, height: 76)
        layout.minimumLineSpacing = 24
        layout.headerReferenceSize = CGSize(width: Constant.Screen.width, height: 44)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RecordListCell.self, forCellWithReuseIdentifier: RecordListCell.identifier)
        collectionView.register(RecordListHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: RecordListHeaderView.identifier)
        return collectionView
    }()
    private let emptyRecordView = EmptyRecordView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    init(reactor: RecordListReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
        reactor.action.onNext(.loadRecords)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
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
        
        view.addSubview(recordListView)
        recordListView.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func showEmptyRecordView() {
        emptyRecordView.isHidden = false
        recordListView.isHidden = true
    }
    
    private func showRecordListView() {
        emptyRecordView.isHidden = true
        recordListView.isHidden = false
    }
}

extension RecordListViewController: View {
    func bind(reactor: RecordListReactor) {
        let dataSource = RxCollectionViewSectionedReloadDataSource<RecordSection>(
            configureCell: { dataSource, collectionView, indexPath, item in
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecordListCell.identifier, for: indexPath) as! RecordListCell
                cell.configure(with: item)
                
                cell.deleteButtonTapped
                    .asDriver(onErrorDriveWith: .empty())
                    .drive(onNext: { [weak self] in
                        guard let self = self else { return }
                        let popUpVC = ListDeleteViewController()
                        self.present(popUpVC, animated: true)
                        popUpVC.deleteButtonTapped
                            .asDriver(onErrorDriveWith: .empty())
                            .drive(onNext: { [weak self] in
                                guard let self = self else { return }
                                self.reactor?.action.onNext(.deleteRecord(indexPath))
                            })
                            .disposed(by: popUpVC.disposeBag)
                    })
                    .disposed(by: cell.disposeBag)
                
                return cell
            },
            configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
                if kind == UICollectionView.elementKindSectionHeader {
                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: RecordListHeaderView.identifier, for: indexPath) as! RecordListHeaderView
                    let section = dataSource.sectionModels[indexPath.section]
                    headerView.setCount(section.items.count)
                    return headerView
                }
                return UICollectionReusableView()
            }
        )
        
        reactor.state
            .map { $0.sections }
            .bind(to: recordListView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.sections.first?.items.isEmpty ?? true }
            .distinctUntilChanged()
            .asDriver(onErrorJustReturn: true)
            .drive(onNext: { [weak self] isEmpty in
                guard let self = self else { return }
                if isEmpty {
                    self.showEmptyRecordView()
                } else {
                    self.showRecordListView()
                }
            })
            .disposed(by: disposeBag)
        
        reactor.state
            .map { $0.isRecordDeleted }
            .distinctUntilChanged()
            .filter { $0 }
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { _ in
                MDToast.show(type: .delete)
            })
            .disposed(by: disposeBag)
    }
}

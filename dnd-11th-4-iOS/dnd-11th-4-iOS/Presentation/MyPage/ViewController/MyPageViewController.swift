//
//  MyPageViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit

final class MyPageViewController: UIViewController {
    typealias Reactor = MyPageReactor
    var disposeBag = DisposeBag()

    // MARK: - UI Propertise
    
    private let myPageView = MyPageView()
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(MyPageCell.self, forCellReuseIdentifier: MyPageCell.identifier)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindActions()
    }
    
    init(reactor: MyPageReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        view.addSubviews(myPageView, tableView)
        myPageView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(111)
        }
        tableView.snp.makeConstraints {
            $0.top.equalTo(myPageView.snp.bottom).offset(11)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    // MARK: - Bind
    
    private func bindActions() {
        tableView.rx.modelSelected((String, UIImage?).self)
            .compactMap { [weak self] model -> IndexPath? in
                guard let index = self?.reactor?.currentState.data.firstIndex(where: { $0.0 == model.0 }) else { return nil }
                return IndexPath(row: index, section: 0)
            }
            .bind(onNext: { [weak self] indexPath in
                guard let self = self else { return }
                let detailVC = InquiryViewController()
                self.navigationController?.pushViewController(detailVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
}

extension MyPageViewController: View {
    func bind(reactor: MyPageReactor) {
        reactor.state
            .map { $0.data }
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellIdentifier: MyPageCell.identifier, cellType: MyPageCell.self)) { row, element, cell in
                cell.configure(title: element.0, image: element.1)
            }
            .disposed(by: disposeBag)
    }
}

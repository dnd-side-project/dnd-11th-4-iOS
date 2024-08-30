//
//  ListDeleteViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/11/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class ListDeleteViewController: PopUpViewController {
    weak var delegate: ListDeleteDelegate?
    var recordIndex: IndexPath?
    
    let disposeBag = DisposeBag()
    private let popUpView = MDPopUpView(title: "정말 삭제하시겠어요?", cancelTitle: "취소", deleteTitle: "삭제")
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupPopUpView()
        bindActions()
    }
    
    private func setupPopUpView() {
        view.addSubview(popUpView)
        
        popUpView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(117)
            $0.width.equalTo(293)
        }
    }
    
    private func bindActions() {
        popUpView.cancelButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
        
        popUpView.deleteButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self, let index = self.recordIndex else { return }
                self.delegate?.didDeleteRecord(at: index)
                self.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
    }
}

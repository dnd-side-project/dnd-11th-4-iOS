//
//  AccountDeleteViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/25/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class AccountDeleteViewController: PopUpViewController {
    private let disposeBag = DisposeBag()
    private let popUpView = MDPopUpView(title: "정말 탈퇴하시겠어요?", cancelTitle: "취소", deleteTitle: "탈퇴")
    
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
    }
}
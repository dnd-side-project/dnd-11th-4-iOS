//
//  RecordCancelPopUpViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/30/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class RecordCancelPopUpViewController: PopUpViewController {
    let disposeBag = DisposeBag()
    let recordCancelTappedSubject = PublishSubject<Void>()
    private let popUpView = MDPopUpView(title: "글을 저장하지 않고 나가시겠어요?",
                                        cancelTitle: "취소",
                                        deleteTitle: "확인")
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
            .drive(with: self, onNext: { owner, _ in
                owner.dismiss(animated: true)
            })
            .disposed(by: disposeBag)
        
        popUpView.deleteButton.rx.tap
            .asDriver()
            .drive(with: self, onNext: { owner, _ in
                owner.dismiss(animated: true)
                owner.recordCancelTappedSubject.onNext(())
            })
            .disposed(by: disposeBag)
    }
}

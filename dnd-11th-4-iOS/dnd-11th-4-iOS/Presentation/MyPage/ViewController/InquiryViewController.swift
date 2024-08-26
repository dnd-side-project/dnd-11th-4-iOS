//
//  InquiryViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/25/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class InquiryViewController: UIViewController {
    private let disposeBag = DisposeBag()

    // MARK: - UI Propertise
    
    private let navigationBar = MDNavigationBar(type: .inquiry)
    private let titleLabel = MDLabel(attributedString: NSAttributedString.pretendardB20("건의하고 싶은 내용이 있으신가요?"), textColor: .black2, alignment: .center)
    private let descriptionLabel = MDLabel(attributedString: NSAttributedString.pretendardR14("아래 메일로 건의사항을 보내주시면\n반영하여 개선된 서비스로 보답하겠습니다."), textColor: .black3, alignment: .center)
    private let mailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.imageMail!
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    private let emailLabel = MDLabel(attributedString: NSAttributedString.pretendardR14("teamMapddang@gmail.com"), textColor: .black3, alignment: .center)
    
    
    // MARK: - Life Cyle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindAction()
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        view.backgroundColor = .mapWhite
        navigationController?.navigationBar.isHidden = true
        view.addSubviews(navigationBar, titleLabel, descriptionLabel, mailImageView, emailLabel)
        navigationBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(44)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(navigationBar.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview()
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
        mailImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(69)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(138)
            $0.centerX.equalToSuperview()
        }
        emailLabel.snp.makeConstraints {
            $0.top.equalTo(mailImageView.snp.bottom).offset(64)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Bind
    
    private func bindAction() {
        navigationBar.backButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
}

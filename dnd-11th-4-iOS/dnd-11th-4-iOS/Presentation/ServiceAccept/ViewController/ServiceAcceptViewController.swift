//
//  ServiceAcceptViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/21/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import ReactorKit

final class ServiceAcceptViewController: UIViewController {
    typealias Reactor = ServiceAcceptReactor
    var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - UI Properties
    
    private let titleLabel = MDLabel(attributedString: NSAttributedString.pretendardSB24("약관에 동의해주세요"), textColor: .point)
    private let descriptionLabel = MDLabel(attributedString: NSAttributedString.pretendardM14("원활한 여행 기록을 위해서\n약관 동의가 필요해요!"), textColor: .gray70)
    
    private let shoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.imageShoes
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let checkboxView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray10
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor.gray50.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private let checkboxButton: MDButton = {
        let button = MDButton(backgroundColor: .gray10)
        button.setImage(image: Constant.Image.iconCheckboxNone!)
        return button
    }()
    
    private let checkLabel = MDLabel(attributedString: NSAttributedString.pretendardM14("(필수)"), textColor: .point)
    
    private let agreeLabel = MDLabel(attributedString: NSAttributedString.pretendardM14("개인정보 수집이용 동의"), textColor: .black2)
    
    private let agreeButton: MDButton = {
        let button = MDButton(backgroundColor: .gray40)
        button.setText(attributedString: NSAttributedString.pretendardB16("동의합니다"), color: .gray60)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    private let forwardButton: MDButton = {
        let button = MDButton(backgroundColor: .gray10)
        button.setImage(image: Constant.Image.iconForward!)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindActions()
    }
    
    init(reactor: ServiceAcceptReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        view.backgroundColor = .mapWhite
        view.addSubviews(titleLabel, descriptionLabel, shoesImageView, checkboxView, agreeButton)
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(92)
            $0.leading.equalToSuperview().offset(24)
        }
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        shoesImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(21)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        checkboxView.addSubviews(checkboxButton, checkLabel, agreeLabel, forwardButton)
        checkboxView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-11)
            $0.bottom.equalToSuperview().offset(-121)
            $0.height.equalTo(59)
        }
        checkboxButton.snp.makeConstraints {
            $0.width.height.equalTo(32)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        checkLabel.snp.makeConstraints {
            $0.centerY.equalTo(checkboxButton)
            $0.leading.equalTo(checkboxButton.snp.trailing).offset(4)
        }
        agreeLabel.snp.makeConstraints {
            $0.centerY.equalTo(checkboxButton)
            $0.leading.equalTo(checkLabel.snp.trailing).offset(4)
        }
        
        agreeButton.snp.makeConstraints {
            $0.top.equalTo(checkboxView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-11)
            $0.bottom.equalToSuperview().offset(-37)
        }
        forwardButton.snp.makeConstraints {
            $0.centerY.equalTo(checkboxButton)
            $0.trailing.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Bind
    
    private func bindActions() {
        checkboxButton.rx.tap
            .map { Reactor.Action.toggleCheckbox }
            .bind(onNext: { [weak self] action in
                guard let reactor = self?.reactor else { return }
                reactor.action.onNext(action)
            })
            .disposed(by: disposeBag)
        
        agreeButton.rx.tap
            .asDriver()
            .delay(.milliseconds(300))
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.navigateToViewController(viewController: OnboardingViewController(reactor: OnboardingReactor()))
            })
            .disposed(by: disposeBag)
        
        forwardButton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                let detailVC = ServiceDetailViewController()
                self.navigationController?.pushViewController(detailVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Method
    
    private func updateCheckboxUI(isSelected: Bool) {
        if isSelected {
            checkboxButton.setImage(image: Constant.Image.iconCheckboxSelected!)
            agreeButton.backgroundColor = .black2
            agreeButton.titleLabel?.textColor = .mapWhite
            agreeButton.isUserInteractionEnabled = true
        } else {
            checkboxButton.setImage(image: Constant.Image.iconCheckboxNone!)
            agreeButton.backgroundColor = .gray40
            agreeButton.titleLabel?.textColor = .gray60
            agreeButton.isUserInteractionEnabled = false
        }
    }
}

extension ServiceAcceptViewController: View {
    func bind(reactor: ServiceAcceptReactor) {
        reactor.state
            .map { $0.isCheckboxSelected }
            .distinctUntilChanged()
            .asDriver(onErrorJustReturn: false)
            .drive(onNext: { [weak self] isSelected in
                guard let self = self else { return }
                self.updateCheckboxUI(isSelected: isSelected)
            })
            .disposed(by: disposeBag)
    }
}

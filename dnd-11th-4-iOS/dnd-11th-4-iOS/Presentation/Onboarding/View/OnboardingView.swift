//
//  OnboardingView.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/13/24.
//

import UIKit
import SnapKit
import Lottie
import RxSwift
import RxCocoa

final class OnboardingView: UIView {
    let colorSelected = PublishSubject<ColorType>()
    private let disposeBag = DisposeBag()
    
    private var selectedButton: MDButton?
    
    private let mapAnimationView: LottieAnimationView = {
        let view = LottieAnimationView(name: "Onboarding_Pink")
        view.contentMode = .scaleAspectFit
        view.loopMode = .playOnce
        view.animationSpeed = 0.8
        return view
    }()
    
    private let titleLabel: MDLabel = {
        let label = MDLabel(attributedString: NSAttributedString.pretendardB20("채우고싶은 색상을 선택해주세요"), textColor: .black2, alignment: .center)
        return label
    }()
    
    private let descriptionLabel: MDLabel = {
        let label = MDLabel(attributedString: NSAttributedString.pretendardM16("해당 지역 명소를 많이 다녀올 수록\n지도가 선명해져요"), textColor: .black4, alignment: .center)
        return label
    }()
    
    private let colorStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 14
        return stackView
    }()
    
    private let pinkButton = MDButton(backgroundColor: .mapPink3, cornerRadius: 15)
    
    private let orangeButton = MDButton(backgroundColor: .mapOrange3, cornerRadius: 15)
    
    private let yellowButton = MDButton(backgroundColor: .mapYellow3, cornerRadius: 15)
    
    private let greenButton = MDButton(backgroundColor: .mapGreen3, cornerRadius: 15)
    
    private let blueButton = MDButton(backgroundColor: .mapBlue3, cornerRadius: 15)
    
    private let purpleButton = MDButton(backgroundColor: .mapPurple3, cornerRadius: 15)

    let selectButton: MDButton = {
        let button = MDButton(backgroundColor: .black2)
        button.setText(attributedString: NSAttributedString.pretendardB16("선택완료"), color: .mapWhite)
        button.titleLabel?.textAlignment = .center
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        bindButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Method
    
    func updateAnimationView(with animationName: String) {
        mapAnimationView.stop()
        mapAnimationView.animation = LottieAnimation.named(animationName)
        mapAnimationView.animationSpeed = 0.8
        mapAnimationView.play()
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        backgroundColor = .mapWhite
        addSubviews(titleLabel, descriptionLabel, mapAnimationView, colorStackView, selectButton)
        
        [pinkButton, orangeButton, yellowButton, greenButton, blueButton, purpleButton].forEach { view in
            colorStackView.addArrangedSubview(view)
            view.snp.makeConstraints { make in
                make.height.width.equalTo(30)
            }
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(56)
            $0.leading.trailing.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
        
        mapAnimationView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(352)
        }
        
        colorStackView.snp.makeConstraints {
            $0.top.equalTo(mapAnimationView.snp.bottom).offset(73)
            $0.leading.trailing.equalToSuperview().inset(62)
            $0.height.equalTo(30)
        }
        
        selectButton.snp.makeConstraints {
            $0.top.equalTo(colorStackView.snp.bottom).offset(60)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
    
    private func addSelectedButtonlayer(button: MDButton, color: ColorType) {
        selectedButton?.layer.borderWidth = 0
        selectedButton?.layer.borderColor = UIColor.clear.cgColor
        selectedButton = button
        
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        colorSelected.onNext(color)
    }
    
    // MARK: - Bind
    
    private func bindButtons() {
        let colorButtons: [(MDButton, ColorType)] = [
            (pinkButton, ColorType.pink),
            (orangeButton, ColorType.orange),
            (yellowButton, ColorType.yellow),
            (greenButton, ColorType.green),
            (blueButton, ColorType.blue),
            (purpleButton, ColorType.purple)
        ]
        
        colorButtons.forEach { (button, color) in
            button.rx.tap
                .asDriver()
                .drive(onNext: { [weak self] in
                    guard let self = self else { return }
                    self.addSelectedButtonlayer(button: button, color: color)
                    self.colorSelected.onNext(color)
                })
                .disposed(by: disposeBag)
        }
    }
}

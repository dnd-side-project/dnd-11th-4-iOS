//
//  LoginViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/19/24.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    private let descriptionLabel: MDLabel = {
        let label = MDLabel(attributedString: NSAttributedString.pretendardSB16("방방곡곡 대한민국 도장깨기"), textColor: .gray80, alignment: .center)
        return label
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.logoBlack
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let flagImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.imageStart
        imageView.contentMode = .scaleAspectFill
        imageView.isUserInteractionEnabled = false
        return imageView
    }()
    
    private let appleLoginButton: MDButton = {
        let button = MDButton(backgroundColor: .mapBlack)
        button.setImage(image: Constant.Image.btnAppleLogin!)
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.layer.cornerRadius = 12
        return button
    }()
    
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .mapWhite
        
        view.addSubviews(descriptionLabel, logoImageView, flagImageView, appleLoginButton)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(170)
            $0.leading.trailing.equalToSuperview()
        }
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(68)
            $0.centerX.equalToSuperview()
        }
        
        flagImageView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(380)
            $0.centerX.equalToSuperview()
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-43)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(46)
        }
    }
}

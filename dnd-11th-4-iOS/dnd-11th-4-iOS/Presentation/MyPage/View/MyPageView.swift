//
//  MyPageView.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/23/24.
//

import UIKit
import SnapKit

final class MyPageView: UIView {
    
    // MARK: - UI Propertise
    
    private let userInfoView = UIView()
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.imageProfile
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let nameLabel = MDLabel(attributedString: NSAttributedString.pretendardSB16("푸른뻐꾸기님"), textColor: .mapBlack)
    private let loginLabel = MDLabel(attributedString: NSAttributedString.pretendardR14("Apple 로그인"), textColor: .gray70)
    private let underlineView = UIView()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupNameLabel(_ text : String) {
        nameLabel.attributedText = NSAttributedString.pretendardSB16(text)
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        backgroundColor = .mapWhite
        addSubviews(userInfoView, underlineView)
        userInfoView.addSubviews(profileImageView, nameLabel, loginLabel)
        userInfoView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(84)
        }
        profileImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.height.width.equalTo(64)
        }
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(10)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(13)
        }
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
        }
        underlineView.backgroundColor = .gray40
        underlineView.snp.makeConstraints {
            $0.top.equalTo(userInfoView.snp.bottom).offset(11)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

//
//  AgreeViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/21/24.
//

import UIKit
import SnapKit

final class AgreeViewController: UIViewController {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
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
        
        checkboxView.addSubviews(checkboxButton, checkLabel, agreeLabel)
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
    }
}

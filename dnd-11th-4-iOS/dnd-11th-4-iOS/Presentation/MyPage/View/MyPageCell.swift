//
//  MyPageCell.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/23/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class MyPageCell: UITableViewCell {
    static let identifier = "MyPageCell"
    
    // MARK: - UI Components
    
    private let menuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.iconMyPage
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private let titleLabel = MDLabel(attributedString: NSAttributedString.pretendardM16("title"), textColor: .mapBlack)
    private let moveButton: MDButton = {
        let button = MDButton(backgroundColor: .clear, cornerRadius: 0)
        button.setImage(image: Constant.Image.iconForward!)
        button.imageView?.tintColor = .gray60
        button.isUserInteractionEnabled = false
        return button
    }()
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        self.selectionStyle = .none
        contentView.addSubviews(menuImageView, titleLabel, moveButton)
        menuImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(20)
            $0.width.height.equalTo(36)
            $0.bottom.equalToSuperview().offset(-12)
        }
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(12)
            $0.bottom.equalToSuperview().offset(-12)
        }
        moveButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-12)
        }
    }
    
    // MARK: - Configuration
    
    func configure(title: String, image: UIImage?) {
        titleLabel.attributedText = NSAttributedString.pretendardM16(title)
        menuImageView.image = image ?? Constant.Image.iconMyPage
    }
}

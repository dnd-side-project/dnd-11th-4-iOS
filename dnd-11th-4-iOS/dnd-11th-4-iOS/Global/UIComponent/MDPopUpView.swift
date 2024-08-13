//
//  MDPopUpView.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/2/24.
//

import UIKit
import SnapKit

final class MDPopUpView: UIView {
    private let titleLabel = MDLabel(attributedString: NSAttributedString.pretendardB16("정말 삭제하시겠어요?"), textColor: .mapBlack)
    
    private let cancelButton: MDButton = {
        let button = MDButton(backgroundColor: .gray40, cornerRadius: 8)
        button.setText(attributedString: NSAttributedString.pretendardM14("취소"), color: .black4)
        button.titleEdgeInsets = UIEdgeInsets(top: 8, left: 18, bottom: 8, right: 18)
        return button
    }()
    
    private let deleteButton: MDButton = {
        let button = MDButton(backgroundColor: .black2, cornerRadius: 8)
        button.setText(attributedString: NSAttributedString.pretendardSB14("삭제"), color: .mapWhite)
        button.titleEdgeInsets = UIEdgeInsets(top: 8, left: 18, bottom: 8, right: 18)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .mapWhite
        self.layer.cornerRadius = 12
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubviews(titleLabel, cancelButton, deleteButton)
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
        }
        cancelButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-16)
            $0.leading.equalToSuperview().offset(147)
            $0.height.equalTo(36)
            $0.width.equalTo(61)
        }
        deleteButton.snp.makeConstraints {
            $0.bottom.equalTo(cancelButton.snp.bottom)
            $0.leading.equalTo(cancelButton.snp.trailing).offset(8)
            $0.height.equalTo(36)
            $0.width.equalTo(61)
        }
    }
}

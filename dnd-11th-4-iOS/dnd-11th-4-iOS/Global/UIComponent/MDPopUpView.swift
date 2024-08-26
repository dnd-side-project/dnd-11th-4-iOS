//
//  MDPopUpView.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/2/24.
//

import UIKit
import SnapKit

final class MDPopUpView: UIView {
    private let titleLabel: MDLabel
    let cancelButton: MDButton
    let deleteButton: MDButton
    
    // init에서 제목과 버튼 텍스트를 매개변수로 받도록 수정
    init(title: String, cancelTitle: String, deleteTitle: String) {
        self.titleLabel = MDLabel(attributedString: NSAttributedString.pretendardB16(title), textColor: .mapBlack)
        
        self.cancelButton = MDButton(backgroundColor: .gray40, cornerRadius: 8)
        self.cancelButton.setText(attributedString: NSAttributedString.pretendardM14(cancelTitle), color: .black4)
        self.cancelButton.titleEdgeInsets = UIEdgeInsets(top: 8, left: 18, bottom: 8, right: 18)
        
        self.deleteButton = MDButton(backgroundColor: .black2, cornerRadius: 8)
        self.deleteButton.setText(attributedString: NSAttributedString.pretendardSB14(deleteTitle), color: .mapWhite)
        self.deleteButton.titleEdgeInsets = UIEdgeInsets(top: 8, left: 18, bottom: 8, right: 18)
        
        super.init(frame: .zero)
        
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

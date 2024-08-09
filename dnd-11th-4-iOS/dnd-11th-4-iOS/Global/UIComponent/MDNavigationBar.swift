//
//  MDNavigationBar.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 7/31/24.
//

import UIKit
import SnapKit

enum NavigationBarType {
    case list, add, inquiry
    
    var text: String {
        switch self {
        case .list:
            return "내 기록"
        case .add:
            return "기록 추가"
        case .inquiry:
            return "1:1 문의"
        }
    }
}

final class MDNavigationBar: UIView {
    private let backButton = MDButton(backgroundColor: .clear).setImage(image: .iconBack)
    private let detailText = MDLabel(attributedString: NSAttributedString.pretendardB16("dummy"), color: .mapBlack)
    private let underlineView = UIView()
    
    init(type: NavigationBarType) {
        super.init(frame: .zero)
        self.backgroundColor = .mapWhite
        setUI(type: type)
        setupUnderline()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(type: NavigationBarType) {
        switch type {
        case .list:
            self.detailText.attributedText = NSAttributedString.pretendardB16(type.text)
            
            self.addSubviews(detailText)
            detailText.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        case .add, .inquiry:
            self.detailText.attributedText = NSAttributedString.pretendardB16(type.text)
            
            self.addSubviews(backButton, detailText)
            backButton.imageView?.contentMode = .scaleAspectFit
            backButton.snp.makeConstraints {
                $0.leading.equalToSuperview().offset(16)
                $0.centerY.equalToSuperview()
                $0.width.height.equalTo(30)
            }
            detailText.snp.makeConstraints {
                $0.center.equalToSuperview()
            }
        }
    }
    
    private func setupUnderline() {
        underlineView.backgroundColor = .gray40
        self.addSubview(underlineView)
        underlineView.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}

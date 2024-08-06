//
//  MDNavigationBar.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 7/31/24.
//

import UIKit
import SnapKit

final class MDNavigationBar: UIView {
    private let backButton: UIButton = {
        let button = UIButton()
        button.setImage(Constant.Image.iconBack, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.attributedText = NSAttributedString.pretendardB16("기록 추가")
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        self.backgroundColor = .white
        self.addSubview(backButton)
        self.addSubview(titleLabel)
        
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

//
//  EmptyRecordView.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/9/24.
//

import UIKit
import SnapKit

final class EmptyRecordView: UIView {
    private let emptyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(resource: .imageEmpty)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionLabel = MDLabel(attributedString: NSAttributedString.pretendardM16("아직 작성된 기록이 없어요"), textColor: .black4, alignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .mapWhite
        addSubviews(emptyImageView, descriptionLabel)
        
        emptyImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().multipliedBy(0.8)
            $0.height.equalTo(332)
            $0.width.equalTo(273)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(emptyImageView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.leading.trailing.equalTo(emptyImageView)
        }
    }
}

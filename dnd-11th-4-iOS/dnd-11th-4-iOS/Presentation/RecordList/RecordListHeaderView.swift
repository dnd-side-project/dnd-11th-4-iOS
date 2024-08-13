//
//  RecordListHeaderView.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/8/24.
//

import UIKit
import SnapKit

final class RecordListHeaderView: UICollectionReusableView {
    static let identifier = "RecordListHeaderView"
    
    private let countLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("전체"), textColor: .mapBlack)
    private let numberLabel = MDLabel(attributedString: NSAttributedString.pretendardSB14("(0)"), textColor: .gray70)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .mapWhite
        addSubview(countLabel)
        addSubview(numberLabel)
        
        countLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        numberLabel.snp.makeConstraints {
            $0.leading.equalTo(countLabel.snp.trailing).offset(2)
            $0.centerY.equalToSuperview()
        }
    }
    
    func setCount(_ count: Int) {
        countLabel.attributedText = NSAttributedString.pretendardSB14("전체")
        numberLabel.attributedText = NSAttributedString.pretendardR14("(\(count))")
    }
}

//
//  RecordImageCell.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/20/24.
//

import UIKit

final class RecordImageCell: UICollectionViewCell {
    
    static let identifier = "RecordImageCell"
    
    private let recordImage = UIImageView(image: Constant.Image.imageEmpty)
    private let deleteButton = UIImageView(image: Constant.Image.iconXCircle)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        layer.cornerRadius = 6
        
        addSubviews(recordImage, deleteButton)
        
        recordImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(6)
            make.width.height.equalTo(20)
        }
    }
}

//
//  RecordImageCell.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/20/24.
//

import UIKit

final class RecordImageCell: UICollectionViewCell {
    
    static let identifier = "RecordImageCell"
    
    var recordImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.imageEmpty
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    private let deleteButton = UIImageView(image: Constant.Image.iconXCircle)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
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

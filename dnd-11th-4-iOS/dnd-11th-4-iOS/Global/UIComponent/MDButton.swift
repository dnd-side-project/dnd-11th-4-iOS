//
//  MDButton.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/1/24.
//

import UIKit

final class MDButton: UIButton {
    
    init(backgroundColor: UIColor,
         cornerRadius: CGFloat = 12) {
        super.init(frame: .zero)
    
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 글씨만 들어가는 버튼
    @discardableResult
    func setText(attributedString: NSAttributedString, color: UIColor) -> Self {
        self.setAttributedTitle(attributedString, for: .normal)
        self.titleLabel?.textColor = color
        return self
    }
    
    /// 이미지만 들어가는 버튼
    @discardableResult
    func setImage(image: UIImage) -> Self {
        self.setImage(image, for: .normal)
        return self
    }
    
    /// 이미지랑 글씨 모두 들어가는 버튼
    @discardableResult
    func setImageAndText(attributedString: NSAttributedString, color: UIColor, image: UIImage) -> Self {
        self.setAttributedTitle(attributedString, for: .normal)
        self.titleLabel?.textColor = color
        self.setImage(image, for: .normal)
        self.semanticContentAttribute = .forceLeftToRight
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        return self
    }
    
    /// 이미지 resize 버튼
    @discardableResult
    func setResizedImage(attributedString: NSAttributedString, color: UIColor, image: UIImage, width: Double, height: Double) -> Self {
        let resizedImage = image.resizeImageTo(size: CGSize(width: width, height: height))
        self.setAttributedTitle(attributedString, for: .normal)
        self.setImageAndText(attributedString: attributedString, color: color, image: resizedImage!)
        self.semanticContentAttribute = .forceRightToLeft
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 83, bottom: 0, right: 0)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 83)
        return self
    }
}

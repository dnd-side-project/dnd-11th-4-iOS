//
//  MTButton.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/1/24.
//

import UIKit

final class MTButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 글씨만 들어가는 버튼
    @discardableResult
    func setText(text: String, font: NSAttributedString, color: UIColor) -> Self {
        self.titleLabel?.text = text
        self.titleLabel?.attributedText = font
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
    func setImageAndText(text: String, font: NSAttributedString, color: UIColor, image: UIImage) -> Self {
        self.titleLabel?.text = text
        self.titleLabel?.attributedText = font
        self.titleLabel?.textColor = color
        self.setImage(image, for: .normal)
        self.semanticContentAttribute = .forceLeftToRight
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        return self
    }
    
    @discardableResult
    func setbackgroundColor(color: UIColor) -> Self {
        self.backgroundColor = color
        return self
    }
    
    @discardableResult
    func setLayer(cornerRadius: CGFloat = 12) -> Self {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        return self
    }
    
}

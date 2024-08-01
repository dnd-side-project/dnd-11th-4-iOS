//
//  MTLabel.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/1/24.
//

import UIKit

final class MTLabel: UILabel {
    
    init(font: NSAttributedString,
         color: UIColor,
         alignment: NSTextAlignment = .left,
         lines: Int = 0,
         text: String? = nil) {
        super.init(frame: .zero)
        self.attributedText = font
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = lines
        self.text = text
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

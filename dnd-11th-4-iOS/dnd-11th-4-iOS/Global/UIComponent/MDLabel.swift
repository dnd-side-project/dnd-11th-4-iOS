//
//  MDLabel.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/1/24.
//

import UIKit

final class MDLabel: UILabel {
    
    init(attributedString: NSAttributedString,
         color: UIColor,
         alignment: NSTextAlignment = .left,
         lines: Int = 0) {
        super.init(frame: .zero)
        self.attributedText = attributedString
        self.textColor = color
        self.textAlignment = alignment
        self.numberOfLines = lines
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

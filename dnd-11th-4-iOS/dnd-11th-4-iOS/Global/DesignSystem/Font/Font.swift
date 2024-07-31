//
//  Font.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/18/24.
//

import UIKit

extension NSAttributedString {
    static var pretendardB1: (String) -> NSAttributedString {
        return customFont(.pretendardBold, size: 16, lineHeight: 1.4, letterSpacing: -0.005)
    }
    
    static var pretendardB2: (String) -> NSAttributedString {
        return customFont(.pretendardBold, size: 20, lineHeight: 1.32, letterSpacing: -0.01)
    }
    
    static var pretendardB3: (String) -> NSAttributedString {
        return customFont(.pretendardBold, size: 24, lineHeight: 1.24, letterSpacing: -0.02)
    }
    
    static var pretendardSB1: (String) -> NSAttributedString {
        return customFont(.pretendardSemiBold, size: 10, lineHeight: 1.4, letterSpacing: 0)
    }
    
    static var pretendardSB2: (String) -> NSAttributedString {
        return customFont(.pretendardSemiBold, size: 12, lineHeight: 1.4, letterSpacing: 0)
    }
    
    static var pretendardSB3: (String) -> NSAttributedString {
        return customFont(.pretendardSemiBold, size: 14, lineHeight: 1.4, letterSpacing: -0.005)
    }
    
    static var pretendardSB4: (String) -> NSAttributedString {
        return customFont(.pretendardSemiBold, size: 16, lineHeight: 1.4, letterSpacing: -0.005)
    }
    
    static var pretendardM1: (String) -> NSAttributedString {
        return customFont(.pretendardMedium, size: 10, lineHeight: 1.4, letterSpacing: 0)
    }
    
    static var pretendardM2: (String) -> NSAttributedString {
        return customFont(.pretendardMedium, size: 14, lineHeight: 1.4, letterSpacing: -0.005)
    }
    
    static var pretendardM3: (String) -> NSAttributedString {
        return customFont(.pretendardMedium, size: 16, lineHeight: 1.4, letterSpacing: -0.005)
    }
    
    static var pretendardR1: (String) -> NSAttributedString {
        return customFont(.pretendardRegular, size: 10, lineHeight: 1.4, letterSpacing: 0)
    }
    
    static var pretendardR2: (String) -> NSAttributedString {
        return customFont(.pretendardRegular, size: 12, lineHeight: 1.4, letterSpacing: 0)
    }
    
    static var pretendardR3: (String) -> NSAttributedString {
        return customFont(.pretendardRegular, size: 14, lineHeight: 1.4, letterSpacing: -0.005)
    }
    
    static var pretendardR4: (String) -> NSAttributedString {
        return customFont(.pretendardRegular, size: 16, lineHeight: 1.4, letterSpacing: -0.005)
    }
    
    static var peopleFirst: (String) -> NSAttributedString {
        return customFont(.peoplefirst, size: 19, lineHeight: 1.4, letterSpacing: -0.02)
    }
}

extension NSAttributedString {
    static func customFont(_ name: FontName, size: CGFloat, lineHeight: CGFloat, letterSpacing: CGFloat) -> (String) -> NSAttributedString {
        return { text in
            let height = size * lineHeight
            let spacing = size * letterSpacing
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = height / size
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size),
                .paragraphStyle: paragraphStyle,
                .kern: spacing
            ]
            
            return NSAttributedString(string: text, attributes: attributes)
        }
    }
}

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case peoplefirst = "PeopleFirstNeat&Loud"
}

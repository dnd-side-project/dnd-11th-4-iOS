//
//  Font.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/18/24.
//

import UIKit

extension NSAttributedString {
    
    static var pretendardB14: (String) -> NSAttributedString {
        return customFont(.pretendardBold, size: 14, lineHeight: 1.0, letterSpacing: -0.1)
    }
    
    static var pretendardB16: (String) -> NSAttributedString {
        return customFont(.pretendardBold, size: 16, lineHeight: 1.0, letterSpacing: -0.1)
    }
    
    static var pretendardB20: (String) -> NSAttributedString {
        return customFont(.pretendardBold, size: 20, lineHeight: 1.0, letterSpacing: -0.34)
    }
    
    static var pretendardB24: (String) -> NSAttributedString {
        return customFont(.pretendardBold, size: 24, lineHeight: 1.0, letterSpacing: -0.4)
    }
    
    static var pretendardSB10: (String) -> NSAttributedString {
        return customFont(.pretendardSemiBold, size: 10, lineHeight: 1.0, letterSpacing: 0)
    }
    
    static var pretendardSB12: (String) -> NSAttributedString {
        return customFont(.pretendardSemiBold, size: 12, lineHeight: 1.0, letterSpacing: 0)
    }
    
    static var pretendardSB14: (String) -> NSAttributedString {
        return customFont(.pretendardSemiBold, size: 14, lineHeight: 1.0, letterSpacing: -0.1)
    }
    
    static var pretendardSB16: (String) -> NSAttributedString {
        return customFont(.pretendardSemiBold, size: 16, lineHeight: 1.0, letterSpacing: -0.1)
    }
    
    static var pretendardSB24: (String) -> NSAttributedString {
        return customFont(.pretendardSemiBold, size: 24, lineHeight: 1.0, letterSpacing: -0.1)
    }
    
    static var pretendardM10: (String) -> NSAttributedString {
        return customFont(.pretendardMedium, size: 10, lineHeight: 1.0, letterSpacing: 0)
    }
    
    static var pretendardM14: (String) -> NSAttributedString {
        return customFont(.pretendardMedium, size: 14, lineHeight: 1.0, letterSpacing: -0.1)
    }
    
    static var pretendardM16: (String) -> NSAttributedString {
        return customFont(.pretendardMedium, size: 16, lineHeight: 1.15, letterSpacing: -0.1)
    }
    
    static var pretendardR10: (String) -> NSAttributedString {
        return customFont(.pretendardRegular, size: 10, lineHeight: 1.0, letterSpacing: 0)
    }
    
    static var pretendardR12: (String) -> NSAttributedString {
        return customFont(.pretendardRegular, size: 12, lineHeight: 1.0, letterSpacing: 0)
    }
    
    static var pretendardR14: (String) -> NSAttributedString {
        return customFont(.pretendardRegular, size: 14, lineHeight: 1.0, letterSpacing: -0.1)
    }
    
    static var pretendardR16: (String) -> NSAttributedString {
        return customFont(.pretendardRegular, size: 16, lineHeight: 1.0, letterSpacing: -0.1)
    }
    
    static var peopleFirst19: (String) -> NSAttributedString {
        return customFont(.peoplefirst, size: 19, lineHeight: 1.0, letterSpacing: -0.04)
    }
}

extension NSAttributedString {
    static let defaultpretendardM14: [NSAttributedString.Key: Any] = {
        return defaultFont(.pretendardMedium, size: 14, lineHeight: 1.0, letterSpacing: -0.1)
    }()
}

extension NSAttributedString {
    static func customFont(_ name: FontName, size: CGFloat, lineHeight: CGFloat, letterSpacing: CGFloat) -> (String) -> NSAttributedString {
        return { text in
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineHeightMultiple = lineHeight
            
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size),
                .paragraphStyle: paragraphStyle,
                .kern: letterSpacing
            ]
            
            return NSAttributedString(string: text, attributes: attributes)
        }
    }
    
    static func defaultFont(_ name: FontName, size: CGFloat, lineHeight: CGFloat, letterSpacing: CGFloat) -> [NSAttributedString.Key: Any] {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeight
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size),
            .paragraphStyle: paragraphStyle,
            .kern: letterSpacing
        ]
        
        return attributes
    }
}

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case peoplefirst = "PeopleFirstNeat&Loud"
}

//
//  Font.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/18/24.
//

import UIKit

extension UIFont {
    static var pretendardB1: UIFont {
        return customFont(.pretendardBold, size: 16)
    }
    
    static var pretendardB2: UIFont {
        return customFont(.pretendardBold, size: 20)
    }
    
    static var pretendardB3: UIFont {
        return customFont(.pretendardBold, size: 24)
    }
    
    static var pretendardSB1: UIFont {
        return customFont(.pretendardSemiBold, size: 10)
    }
    
    static var pretendardSB2: UIFont {
        return customFont(.pretendardSemiBold, size: 12)
    }
    
    static var pretendardSB3: UIFont {
        return customFont(.pretendardSemiBold, size: 14)
    }
    
    static var pretendardSB4: UIFont {
        return customFont(.pretendardSemiBold, size: 16)
    }
    
    static var pretendardM1: UIFont {
        return customFont(.pretendardMedium, size: 10)
    }
    
    static var pretendardM2: UIFont {
        return customFont(.pretendardMedium, size: 14)
    }
    
    static var pretendardM3: UIFont {
        return customFont(.pretendardMedium, size: 16)
    }
    
    static var pretendardR1: UIFont {
        return customFont(.pretendardRegular, size: 10)
    }
    
    static var pretendardR2: UIFont {
        return customFont(.pretendardRegular, size: 12)
    }
    
    static var pretendardR3: UIFont {
        return customFont(.pretendardRegular, size: 14)
    }
    
    static var pretendardR4: UIFont {
        return customFont(.pretendardRegular, size: 16)
    }
    
    static var peopleFirst: UIFont {
        return customFont(.peoplefirst, size: 19)
    }
}

extension UIFont {
    static func customFont(_ name: FontName, size: CGFloat) -> UIFont {
        return UIFont(name: name.rawValue, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
    case peoplefirst = "PeopleFirstNeat&Loud"
}

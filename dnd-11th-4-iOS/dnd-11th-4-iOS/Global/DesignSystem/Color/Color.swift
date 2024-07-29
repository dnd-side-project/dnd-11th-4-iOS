//
//  Color.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/18/24.
//

import UIKit

extension UIColor {
    static var errorRed: UIColor {
        return UIColor(hexCode: "#FF6363")
    }
    
    static var mapPink: UIColor {
        return UIColor(hexCode: "#FF547D")
    }
    
    static var mapOrange: UIColor {
        return UIColor(hexCode: "#FFB629")
    }
    
    static var mapYellow: UIColor {
        return UIColor(hexCode: "#FFE55B")
    }
    
    static var mapGreen: UIColor {
        return UIColor(hexCode: "#00DC80")
    }
    
    static var mapBlue: UIColor {
        return UIColor(hexCode: "#3A7DFF")
    }
    
    static var mapPurple: UIColor {
        return UIColor(hexCode: "#BB45E4")
    }
    
    static var mapGray: UIColor {
        return UIColor(hexCode: "#D9D9D9")
    }
    
    static var mapBackground: UIColor {
        return UIColor(hexCode: "#F3F4F5")
    }
    
    static var mapSelect: UIColor {
        return UIColor(hexCode: "#7A7A7A")
    }
    
    static var mapWhite: UIColor {
        return UIColor(hexCode: "#FFFFFF")
    }
    
    static var gray10: UIColor {
        return UIColor(hexCode: "#F9FAFA")
    }
    
    static var gray20: UIColor {
        return UIColor(hexCode: "#F5F5F5")
    }
    
    static var gray30: UIColor {
        return UIColor(hexCode: "#F1F1F2")
    }
    
    static var gray40: UIColor {
        return UIColor(hexCode: "#ECECEC")
    }
    
    static var gray50: UIColor {
        return UIColor(hexCode: "#D2D4D7")
    }
    
    static var gray60: UIColor {
        return UIColor(hexCode: "#A9ADB2")
    }
    
    static var gray70: UIColor {
        return UIColor(hexCode: "#797F88")
    }
    
    static var gray80: UIColor {
        return UIColor(hexCode: "#4D5560")
    }
    
    static var gray90: UIColor {
        return UIColor(hexCode: "#2E3744")
    }
    
    static var gray95: UIColor {
        return UIColor(hexCode: "#19202B")
    }
    
    static var gray100: UIColor {
        return UIColor(hexCode: "#141A23")
    }
    
    static var mapBlack: UIColor {
        return UIColor(hexCode: "000000")
    }
    
    static var black2: UIColor {
        return UIColor(hexCode: "282828")
    }
    
    static var black3: UIColor {
        return UIColor(hexCode: "4B4B4B")
    }
    
    static var black4: UIColor {
        return UIColor(hexCode: "636363")
    }
}

extension UIColor {
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

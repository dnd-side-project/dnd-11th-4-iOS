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
    
    static var mapPink1: UIColor {
        return UIColor(hexCode: "#FFD8E1")
    }
    
    static var mapPink2: UIColor {
        return UIColor(hexCode: "#FF8BA7")
    }
    
    static var mapPink3: UIColor {
        return UIColor(hexCode: "#FF547D")
    }
    
    static var mapOrange1: UIColor {
        return UIColor(hexCode: "#FFEFCF")
    }
    
    static var mapOrange2: UIColor {
        return UIColor(hexCode: "#FFCC6A")
    }
    
    static var mapOrange3: UIColor {
        return UIColor(hexCode: "#FFB629")
    }
    
    static var mapYellow1: UIColor {
        return UIColor(hexCode: "#FFF9D7")
    }
    
    static var mapYellow2: UIColor {
        return UIColor(hexCode: "#FFE870")
    }
    
    static var mapYellow3: UIColor {
        return UIColor(hexCode: "#FFE03E")
    }
    
    static var mapGreen1: UIColor {
        return UIColor(hexCode: "#DCFFF0")
    }
    
    static var mapGreen2: UIColor {
        return UIColor(hexCode: "#6BEEB7")
    }
    
    static var mapGreen3: UIColor {
        return UIColor(hexCode: "#00DC80")
    }
    
    static var mapBlue1: UIColor {
        return UIColor(hexCode: "#C5D8FF")
    }
    
    static var mapBlue2: UIColor {
        return UIColor(hexCode: "#7CA9FF")
    }
    
    static var mapBlue3: UIColor {
        return UIColor(hexCode: "#3A7DFF")
    }
    
    static var mapPurple1: UIColor {
        return UIColor(hexCode: "#EDCDF8")
    }
    
    static var mapPurple2: UIColor {
        return UIColor(hexCode: "#D879FA")
    }
    
    static var mapPurple3: UIColor {
        return UIColor(hexCode: "#BB45E4")
    }
    
    static var mapGray: UIColor {
        return UIColor(hexCode: "#D2D6DD")
    }
    
    static var mapBackground: UIColor {
        return UIColor(hexCode: "#FAFCFF")
    }
    
    static var mapSelect: UIColor {
        return UIColor(hexCode: "#A3ACBB")
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

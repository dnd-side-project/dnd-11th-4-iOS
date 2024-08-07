//
//  OpacityColorType.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/5/24.
//

import UIKit

enum OpacityColorType {
    case pink(Int)
    case orange(Int)
    case yellow(Int)
    case green(Int)
    case blue(Int)
    case purple(Int)
    
    var color: UIColor {
        switch self {
        case .pink(let opacity):
            return redWithOpacity(opacity: opacity)
        case .orange(let opacity):
            return orangeWithOpacity(opacity: opacity)
        case .yellow(let opacity):
            return yellowWithOpacity(opacity: opacity)
        case .green(let opacity):
            return greenWithOpacity(opacity: opacity)
        case .blue(let opacity):
            return blueWithOpacity(opacity: opacity)
        case .purple(let opacity):
            return purpleWithOpacity(opacity: opacity)
        }
    }
    
    func redWithOpacity(opacity: Int) -> UIColor {
        switch opacity {
        case 1:
            return .mapPink1
        case 2:
            return .mapPink2
        case 3:
            return .mapPink3
        default:
            return .mapGray
        }
    }
    
    func orangeWithOpacity(opacity: Int) -> UIColor {
        switch opacity {
        case 1:
            return .mapOrange1
        case 2:
            return .mapOrange2
        case 3:
            return .mapOrange3
        default:
            return .mapGray
        }
    }
    
    func yellowWithOpacity(opacity: Int) -> UIColor {
        switch opacity {
        case 1:
            return .mapYellow1
        case 2:
            return .mapYellow2
        case 3:
            return .mapYellow3
        default:
            return .mapGray
        }
    }
    
    func greenWithOpacity(opacity: Int) -> UIColor {
        switch opacity {
        case 1:
            return .mapGreen1
        case 2:
            return .mapGreen2
        case 3:
            return .mapGreen3
        default:
            return .mapGray
        }
    }
    
    func blueWithOpacity(opacity: Int) -> UIColor {
        switch opacity {
        case 1:
            return .mapBlue1
        case 2:
            return .mapBlue2
        case 3:
            return .mapBlue3
        default:
            return .mapGray
        }
    }
    
    func purpleWithOpacity(opacity: Int) -> UIColor {
        switch opacity {
        case 1:
            return .mapPurple1
        case 2:
            return .mapPurple2
        case 3:
            return .mapPurple3
        default:
            return .mapGray
        }
    }
}

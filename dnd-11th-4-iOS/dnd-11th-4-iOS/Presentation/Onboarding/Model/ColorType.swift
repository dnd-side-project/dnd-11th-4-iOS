//
//  ColorType.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/16/24.
//

import Foundation

enum ColorType {
    case pink
    case orange
    case yellow
    case green
    case blue
    case purple
    
    var fileName: String {
        switch self {
        case .pink:
            return "Onboarding_Pink"
        case .orange: 
            return "Onboarding_Orange"
        case .yellow: 
            return "Onboarding_Yellow"
        case .green: 
            return "Onboarding_Green"
        case .blue: 
            return "Onboarding_Blue"
        case .purple: 
            return "Onboarding_Purple"
        }
    }
}

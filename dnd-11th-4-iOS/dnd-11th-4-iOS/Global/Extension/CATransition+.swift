//
//  CATransition+.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/30/24.
//

import UIKit

extension CATransition {
    func fadeType() -> CATransition {
        duration = 0.8
        timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        type = CATransitionType.fade
        return self
    }
}

//
//  CALayer+.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

extension CALayer {
    func applyShadow(
        color: UIColor = .gray40,
        alpha: Float = 1,
        x: CGFloat = 0,
        y: CGFloat = -4,
        blur: CGFloat = 16,
        spread: CGFloat = 0) {
            
            masksToBounds = false
            shadowColor = color.cgColor
            shadowOpacity = alpha
            shadowOffset = CGSize(width: x, height: y)
            shadowRadius = blur / 2.0
            if spread == 0 {
                shadowPath = nil
            } else {
                let dx = -spread
                let rect = bounds.insetBy(dx: dx, dy: dx)
                shadowPath = UIBezierPath(rect: rect).cgPath
            }
        }
}

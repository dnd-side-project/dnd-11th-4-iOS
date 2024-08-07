//
//  DrawMapProtocol.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

struct MapUIModel {
    let backgroundColor: UIColor
    let opacity: Int
}

protocol DrawMapProtocol: AnyObject {
    var shape: UIBezierPath { get set }
    var shapeLayer: CAShapeLayer { get set }
    func drawMap()
    func bindMapUI(color: UIColor)
}

extension DrawMapProtocol where Self: UIView {
    func bindMapUI(color: UIColor) {
        shapeLayer.fillColor = color.cgColor
    }
}

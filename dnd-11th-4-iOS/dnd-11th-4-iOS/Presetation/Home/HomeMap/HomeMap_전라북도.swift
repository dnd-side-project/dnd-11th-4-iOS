//
//  HomeMap_전라북도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_전라북도: UIView, DrawMapProtocol {
    
    var shape = UIBezierPath()
    var shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        drawMap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawMap() {
        shape.move(to: CGPoint(x: 193.28, y: 428.07))
        shape.addCurve(to: CGPoint(x: 189.67, y: 429.88), controlPoint1: CGPoint(x: 191.95, y: 428.29), controlPoint2: CGPoint(x: 190.69, y: 428.9))
        shape.addLine(to: CGPoint(x: 174.05, y: 444.88))
        shape.addCurve(to: CGPoint(x: 171.97, y: 449.76), controlPoint1: CGPoint(x: 172.73, y: 446.16), controlPoint2: CGPoint(x: 171.97, y: 447.92))
        shape.addCurve(to: CGPoint(x: 169.08, y: 496.01), controlPoint1: CGPoint(x: 171.97, y: 492.78), controlPoint2: CGPoint(x: 170.83, y: 494.8))
        shape.addCurve(to: CGPoint(x: 164.67, y: 497.22), controlPoint1: CGPoint(x: 167.85, y: 496.88), controlPoint2: CGPoint(x: 166.31, y: 497.35))
        shape.addLine(to: CGPoint(x: 125.21, y: 494.11))
        shape.addCurve(to: CGPoint(x: 118.97, y: 487.36), controlPoint1: CGPoint(x: 121.69, y: 493.82), controlPoint2: CGPoint(x: 118.97, y: 490.88))
        shape.addCurve(to: CGPoint(x: 115.69, y: 475.25), controlPoint1: CGPoint(x: 118.97, y: 478.67), controlPoint2: CGPoint(x: 117.73, y: 476.47))
        shape.addLine(to: CGPoint(x: 102.56, y: 467.37))
        shape.addCurve(to: CGPoint(x: 93.03, y: 470.12), controlPoint1: CGPoint(x: 99.18, y: 465.34), controlPoint2: CGPoint(x: 94.8, y: 466.62))
        shape.addLine(to: CGPoint(x: 85.91, y: 484.25))
        shape.addCurve(to: CGPoint(x: 76.33, y: 486.97), controlPoint1: CGPoint(x: 84.13, y: 487.79), controlPoint2: CGPoint(x: 79.7, y: 489.04))
        shape.addLine(to: CGPoint(x: 62.04, y: 478.2))
        shape.addLine(to: CGPoint(x: 85.18, y: 434.88))
        shape.addCurve(to: CGPoint(x: 85.53, y: 431.78), controlPoint1: CGPoint(x: 85.68, y: 433.93), controlPoint2: CGPoint(x: 85.81, y: 432.82))
        shape.addLine(to: CGPoint(x: 82.6, y: 420.74))
        shape.addLine(to: CGPoint(x: 128.34, y: 405.99))
        shape.addCurve(to: CGPoint(x: 146.14, y: 408.4), controlPoint1: CGPoint(x: 134.33, y: 404.06), controlPoint2: CGPoint(x: 140.88, y: 404.95))
        shape.addLine(to: CGPoint(x: 156.53, y: 415.2))
        shape.addCurve(to: CGPoint(x: 172.81, y: 412.34), controlPoint1: CGPoint(x: 161.44, y: 418.4), controlPoint2: CGPoint(x: 168.78, y: 416.58))
        shape.addCurve(to: CGPoint(x: 176.02, y: 412.76), controlPoint1: CGPoint(x: 173.79, y: 412.78), controlPoint2: CGPoint(x: 174.9, y: 412.94))
        shape.addLine(to: CGPoint(x: 190.1, y: 410.52))
        shape.addLine(to: CGPoint(x: 193.28, y: 428.07))
        shape.close()
        
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.mapBackground.cgColor
        shapeLayer.fillColor = UIColor.mapGray.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return shape.contains(point)
    }
    
    
}

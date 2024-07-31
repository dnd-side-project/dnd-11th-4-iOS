//
//  OnboardingMap_전라북도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_전라북도: UIView, DrawMapProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawMap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        drawMap()
    }
    
    func drawMap() {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 191.89, y: 391.87))
        shape.addCurve(to: CGPoint(x: 189.66, y: 392.99), controlPoint1: CGPoint(x: 191.07, y: 392), controlPoint2: CGPoint(x: 190.29, y: 392.38))
        shape.addLine(to: CGPoint(x: 179.97, y: 402.32))
        shape.addCurve(to: CGPoint(x: 178.68, y: 405.35), controlPoint1: CGPoint(x: 179.15, y: 403.11), controlPoint2: CGPoint(x: 178.68, y: 404.21))
        shape.addCurve(to: CGPoint(x: 176.88, y: 434.11), controlPoint1: CGPoint(x: 178.68, y: 432.1), controlPoint2: CGPoint(x: 177.97, y: 433.36))
        shape.addCurve(to: CGPoint(x: 174.15, y: 434.86), controlPoint1: CGPoint(x: 176.12, y: 434.65), controlPoint2: CGPoint(x: 175.17, y: 434.94))
        shape.addLine(to: CGPoint(x: 149.67, y: 432.93))
        shape.addCurve(to: CGPoint(x: 145.81, y: 428.73), controlPoint1: CGPoint(x: 147.49, y: 432.75), controlPoint2: CGPoint(x: 145.81, y: 430.92))
        shape.addCurve(to: CGPoint(x: 143.77, y: 421.2), controlPoint1: CGPoint(x: 145.81, y: 423.33), controlPoint2: CGPoint(x: 145.03, y: 421.96))
        shape.addLine(to: CGPoint(x: 135.62, y: 416.3))
        shape.addCurve(to: CGPoint(x: 129.71, y: 418.01), controlPoint1: CGPoint(x: 133.53, y: 415.04), controlPoint2: CGPoint(x: 130.81, y: 415.83))
        shape.addLine(to: CGPoint(x: 125.3, y: 426.79))
        shape.addCurve(to: CGPoint(x: 119.35, y: 428.49), controlPoint1: CGPoint(x: 124.19, y: 429), controlPoint2: CGPoint(x: 121.45, y: 429.78))
        shape.addLine(to: CGPoint(x: 110.49, y: 423.03))
        shape.addLine(to: CGPoint(x: 124.84, y: 396.09))
        shape.addCurve(to: CGPoint(x: 125.06, y: 394.17), controlPoint1: CGPoint(x: 125.15, y: 395.51), controlPoint2: CGPoint(x: 125.23, y: 394.82))
        shape.addLine(to: CGPoint(x: 123.25, y: 387.3))
        shape.addLine(to: CGPoint(x: 151.62, y: 378.14))
        shape.addCurve(to: CGPoint(x: 162.66, y: 379.63), controlPoint1: CGPoint(x: 155.33, y: 376.93), controlPoint2: CGPoint(x: 159.39, y: 377.48))
        shape.addLine(to: CGPoint(x: 169.1, y: 383.86))
        shape.addCurve(to: CGPoint(x: 179.2, y: 382.08), controlPoint1: CGPoint(x: 172.15, y: 385.85), controlPoint2: CGPoint(x: 176.7, y: 384.72))
        shape.addCurve(to: CGPoint(x: 181.19, y: 382.34), controlPoint1: CGPoint(x: 179.81, y: 382.35), controlPoint2: CGPoint(x: 180.5, y: 382.46))
        shape.addLine(to: CGPoint(x: 189.92, y: 380.95))
        shape.addLine(to: CGPoint(x: 191.89, y: 391.87))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.layer.addSublayer(shapeLayer)
    }
}

//
//  OnboardingMap_울산.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_울산: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 280.22, y: 403.13))
        shape.addLine(to: CGPoint(x: 273.56, y: 427.26))
        shape.addLine(to: CGPoint(x: 267.3, y: 423.06))
        shape.addLine(to: CGPoint(x: 259.1, y: 417.56))
        shape.addCurve(to: CGPoint(x: 257.78, y: 416.13), controlPoint1: CGPoint(x: 258.55, y: 417.2), controlPoint2: CGPoint(x: 258.1, y: 416.7))
        shape.addLine(to: CGPoint(x: 255.69, y: 412.39))
        shape.addCurve(to: CGPoint(x: 254.04, y: 410.77), controlPoint1: CGPoint(x: 255.29, y: 411.7), controlPoint2: CGPoint(x: 254.72, y: 411.14))
        shape.addLine(to: CGPoint(x: 263.08, y: 404.69))
        shape.addCurve(to: CGPoint(x: 268.61, y: 403.13), controlPoint1: CGPoint(x: 264.74, y: 403.67), controlPoint2: CGPoint(x: 266.66, y: 403.13))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        self.layer.addSublayer(shapeLayer)
    }
}

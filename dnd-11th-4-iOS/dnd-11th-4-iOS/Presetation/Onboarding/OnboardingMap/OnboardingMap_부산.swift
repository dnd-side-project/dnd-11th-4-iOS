//
//  OnboardingMap_부산.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_부산: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 273.56, y: 427.26))
        shape.addLine(to: CGPoint(x: 269.41, y: 442.35))
        shape.addCurve(to: CGPoint(x: 267.21, y: 444.27), controlPoint1: CGPoint(x: 269.13, y: 443.37), controlPoint2: CGPoint(x: 268.26, y: 444.12))
        shape.addLine(to: CGPoint(x: 258.71, y: 445.39))
        shape.addCurve(to: CGPoint(x: 257.41, y: 445.94), controlPoint1: CGPoint(x: 258.23, y: 445.45), controlPoint2: CGPoint(x: 257.79, y: 445.64))
        shape.addLine(to: CGPoint(x: 250.72, y: 451.26))
        shape.addCurve(to: CGPoint(x: 248.28, y: 451.71), controlPoint1: CGPoint(x: 250.03, y: 451.81), controlPoint2: CGPoint(x: 249.12, y: 451.97))
        shape.addLine(to: CGPoint(x: 249.03, y: 440.92))
        shape.addCurve(to: CGPoint(x: 250.88, y: 437.23), controlPoint1: CGPoint(x: 249.13, y: 439.49), controlPoint2: CGPoint(x: 249.8, y: 438.16))
        shape.addLine(to: CGPoint(x: 267.3, y: 423.06))
        shape.addLine(to: CGPoint(x: 273.56, y: 427.26))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        self.layer.addSublayer(shapeLayer)
    }
}

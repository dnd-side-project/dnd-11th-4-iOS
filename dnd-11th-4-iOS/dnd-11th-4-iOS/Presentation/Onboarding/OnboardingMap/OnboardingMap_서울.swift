//
//  OnboardingMap_서울.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_서울: UIView, DrawMapProtocol {
    
    var shape = UIBezierPath()
    var shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawMap()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawMap() {
        shape.move(to: CGPoint(x: 155.67, y: 279.03))
        shape.addLine(to: CGPoint(x: 150.91, y: 283.42))
        shape.addCurve(to: CGPoint(x: 148.47, y: 283.67), controlPoint1: CGPoint(x: 150.25, y: 284.03), controlPoint2: CGPoint(x: 149.25, y: 284.14))
        shape.addLine(to: CGPoint(x: 145.09, y: 281.66))
        shape.addCurve(to: CGPoint(x: 143.04, y: 281.63), controlPoint1: CGPoint(x: 144.46, y: 281.29), controlPoint2: CGPoint(x: 143.68, y: 281.28))
        shape.addLine(to: CGPoint(x: 140.29, y: 283.16))
        shape.addCurve(to: CGPoint(x: 137.31, y: 281.86), controlPoint1: CGPoint(x: 139.11, y: 283.81), controlPoint2: CGPoint(x: 137.63, y: 283.17))
        shape.addLine(to: CGPoint(x: 135.66, y: 275.38))
        shape.addCurve(to: CGPoint(x: 137.06, y: 272.89), controlPoint1: CGPoint(x: 135.39, y: 274.3), controlPoint2: CGPoint(x: 136.01, y: 273.21))
        shape.addCurve(to: CGPoint(x: 137.96, y: 272.34), controlPoint1: CGPoint(x: 137.41, y: 272.79), controlPoint2: CGPoint(x: 137.72, y: 272.6))
        shape.addLine(to: CGPoint(x: 143.18, y: 266.87))
        shape.addCurve(to: CGPoint(x: 144.67, y: 266.23), controlPoint1: CGPoint(x: 143.57, y: 266.46), controlPoint2: CGPoint(x: 144.11, y: 266.23))
        shape.addCurve(to: CGPoint(x: 152.29, y: 268.29), controlPoint1: CGPoint(x: 151.37, y: 266.23), controlPoint2: CGPoint(x: 152.29, y: 267.15))
        shape.addLine(to: CGPoint(x: 155.5, y: 275.86))
        shape.addCurve(to: CGPoint(x: 155.67, y: 279.03), controlPoint1: CGPoint(x: 156.54, y: 276.63), controlPoint2: CGPoint(x: 156.62, y: 278.15))
        shape.close()
        
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        self.layer.addSublayer(shapeLayer)
    }
}

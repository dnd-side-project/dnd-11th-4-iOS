//
//  OnboardingMap_광주.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_광주: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 142.37, y: 447.47))
        shape.addLine(to: CGPoint(x: 130.63, y: 450.68))
        shape.addCurve(to: CGPoint(x: 126.92, y: 449.72), controlPoint1: CGPoint(x: 129.31, y: 451.04), controlPoint2: CGPoint(x: 127.9, y: 450.68))
        shape.addLine(to: CGPoint(x: 125.26, y: 448.12))
        shape.addCurve(to: CGPoint(x: 124.46, y: 443.64), controlPoint1: CGPoint(x: 124.05, y: 446.95), controlPoint2: CGPoint(x: 123.74, y: 445.15))
        shape.addLine(to: CGPoint(x: 127.65, y: 437))
        shape.addCurve(to: CGPoint(x: 130.44, y: 434.86), controlPoint1: CGPoint(x: 128.19, y: 435.88), controlPoint2: CGPoint(x: 129.23, y: 435.09))
        shape.addLine(to: CGPoint(x: 135.83, y: 433.88))
        shape.addCurve(to: CGPoint(x: 139.41, y: 435.1), controlPoint1: CGPoint(x: 137.15, y: 433.63), controlPoint2: CGPoint(x: 138.51, y: 434.1))
        shape.addLine(to: CGPoint(x: 143.34, y: 439.49))
        shape.addCurve(to: CGPoint(x: 143.86, y: 440.22), controlPoint1: CGPoint(x: 143.54, y: 439.71), controlPoint2: CGPoint(x: 143.72, y: 439.96))
        shape.addLine(to: CGPoint(x: 144.75, y: 441.85))
        shape.addCurve(to: CGPoint(x: 142.37, y: 447.47), controlPoint1: CGPoint(x: 145.95, y: 444.05), controlPoint2: CGPoint(x: 144.78, y: 446.8))
        shape.close()
        
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        self.layer.addSublayer(shapeLayer)
    }
}

//
//  OnboardingMap_경상남도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_경상남도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 267.3, y: 423.06))
        shape.addLine(to: CGPoint(x: 250.88, y: 437.23))
        shape.addCurve(to: CGPoint(x: 249.03, y: 440.92), controlPoint1: CGPoint(x: 249.8, y: 438.16), controlPoint2: CGPoint(x: 249.13, y: 439.49))
        shape.addLine(to: CGPoint(x: 248.28, y: 451.71))
        shape.addLine(to: CGPoint(x: 230.7, y: 446.16))
        shape.addCurve(to: CGPoint(x: 227.56, y: 447.48), controlPoint1: CGPoint(x: 229.47, y: 445.77), controlPoint2: CGPoint(x: 228.14, y: 446.33))
        shape.addLine(to: CGPoint(x: 221.89, y: 458.62))
        shape.addCurve(to: CGPoint(x: 219.28, y: 460.05), controlPoint1: CGPoint(x: 221.4, y: 459.59), controlPoint2: CGPoint(x: 220.36, y: 460.16))
        shape.addLine(to: CGPoint(x: 205.58, y: 458.73))
        shape.addCurve(to: CGPoint(x: 203.19, y: 456.09), controlPoint1: CGPoint(x: 204.22, y: 458.59), controlPoint2: CGPoint(x: 203.19, y: 457.45))
        shape.addCurve(to: CGPoint(x: 199.66, y: 453.39), controlPoint1: CGPoint(x: 203.19, y: 454.05), controlPoint2: CGPoint(x: 201.39, y: 452.78))
        shape.addLine(to: CGPoint(x: 189.27, y: 457.11))
        shape.addLine(to: CGPoint(x: 180.48, y: 449.38))
        shape.addCurve(to: CGPoint(x: 178.37, y: 445.42), controlPoint1: CGPoint(x: 179.32, y: 448.36), controlPoint2: CGPoint(x: 178.57, y: 446.95))
        shape.addLine(to: CGPoint(x: 176.88, y: 434.11))
        shape.addCurve(to: CGPoint(x: 178.68, y: 430.67), controlPoint1: CGPoint(x: 177.97, y: 433.35), controlPoint2: CGPoint(x: 178.68, y: 432.1))
        shape.addCurve(to: CGPoint(x: 179.97, y: 402.32), controlPoint1: CGPoint(x: 178.68, y: 404.21), controlPoint2: CGPoint(x: 179.15, y: 403.11))
        shape.addLine(to: CGPoint(x: 189.66, y: 392.99))
        shape.addCurve(to: CGPoint(x: 191.89, y: 391.86), controlPoint1: CGPoint(x: 190.29, y: 392.38), controlPoint2: CGPoint(x: 191.07, y: 392))
        shape.addCurve(to: CGPoint(x: 194.34, y: 392.2), controlPoint1: CGPoint(x: 192.71, y: 391.73), controlPoint2: CGPoint(x: 193.57, y: 391.84))
        shape.addLine(to: CGPoint(x: 208.46, y: 398.82))
        shape.addCurve(to: CGPoint(x: 210.75, y: 401.58), controlPoint1: CGPoint(x: 209.6, y: 399.35), controlPoint2: CGPoint(x: 210.44, y: 400.36))
        shape.addLine(to: CGPoint(x: 212.84, y: 409.69))
        shape.addCurve(to: CGPoint(x: 217.22, y: 412.84), controlPoint1: CGPoint(x: 213.35, y: 411.66), controlPoint2: CGPoint(x: 215.19, y: 412.99))
        shape.addLine(to: CGPoint(x: 221.34, y: 412.54))
        shape.addLine(to: CGPoint(x: 227.92, y: 412.04))
        shape.addLine(to: CGPoint(x: 251.72, y: 410.27))
        shape.addCurve(to: CGPoint(x: 254.04, y: 410.77), controlPoint1: CGPoint(x: 252.54, y: 410.2), controlPoint2: CGPoint(x: 253.35, y: 410.38))
        shape.addCurve(to: CGPoint(x: 255.69, y: 412.39), controlPoint1: CGPoint(x: 254.72, y: 411.14), controlPoint2: CGPoint(x: 255.29, y: 411.7))
        shape.addLine(to: CGPoint(x: 257.78, y: 416.13))
        shape.addCurve(to: CGPoint(x: 259.1, y: 417.56), controlPoint1: CGPoint(x: 258.1, y: 416.7), controlPoint2: CGPoint(x: 258.55, y: 417.2))
        shape.addLine(to: CGPoint(x: 267.3, y: 423.06))
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

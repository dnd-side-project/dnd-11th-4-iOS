//
//  OnboardingMap_강원도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_강원도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 280.17, y: 306.34))
        shape.addLine(to: CGPoint(x: 247.23, y: 308.44))
        shape.addCurve(to: CGPoint(x: 242.76, y: 307.49), controlPoint1: CGPoint(x: 245.68, y: 308.53), controlPoint2: CGPoint(x: 244.14, y: 308.21))
        shape.addLine(to: CGPoint(x: 239.04, y: 305.54))
        shape.addLine(to: CGPoint(x: 219.2, y: 295.16))
        shape.addCurve(to: CGPoint(x: 210.95, y: 295.38), controlPoint1: CGPoint(x: 216.6, y: 293.8), controlPoint2: CGPoint(x: 213.48, y: 293.88))
        shape.addLine(to: CGPoint(x: 198.08, y: 303))
        shape.addCurve(to: CGPoint(x: 193.54, y: 304.19), controlPoint1: CGPoint(x: 196.71, y: 303.82), controlPoint2: CGPoint(x: 195.14, y: 304.23))
        shape.addLine(to: CGPoint(x: 181.03, y: 304.13))
        shape.addLine(to: CGPoint(x: 182.45, y: 303.05))
        shape.addCurve(to: CGPoint(x: 184.12, y: 300.53), controlPoint1: CGPoint(x: 183.27, y: 302.42), controlPoint2: CGPoint(x: 183.86, y: 301.54))
        shape.addLine(to: CGPoint(x: 187.64, y: 286.81))
        shape.addCurve(to: CGPoint(x: 183.2, y: 281.06), controlPoint1: CGPoint(x: 188.39, y: 283.89), controlPoint2: CGPoint(x: 186.2, y: 281.06))
        shape.addCurve(to: CGPoint(x: 175.38, y: 277.78), controlPoint1: CGPoint(x: 177.75, y: 281.06), controlPoint2: CGPoint(x: 175.96, y: 279.73))
        shape.addLine(to: CGPoint(x: 172.51, y: 268.23))
        shape.addCurve(to: CGPoint(x: 172.66, y: 265.15), controlPoint1: CGPoint(x: 172.21, y: 267.22), controlPoint2: CGPoint(x: 172.26, y: 266.13))
        shape.addLine(to: CGPoint(x: 177.14, y: 254.28))
        shape.addCurve(to: CGPoint(x: 175.58, y: 248.78), controlPoint1: CGPoint(x: 177.95, y: 252.3), controlPoint2: CGPoint(x: 177.31, y: 250.02))
        shape.addLine(to: CGPoint(x: 147.87, y: 228.82))
        shape.addLine(to: CGPoint(x: 152.3, y: 223.19))
        shape.addCurve(to: CGPoint(x: 154.16, y: 222.19), controlPoint1: CGPoint(x: 152.76, y: 222.61), controlPoint2: CGPoint(x: 153.43, y: 222.25))
        shape.addLine(to: CGPoint(x: 205.57, y: 218.08))
        shape.addCurve(to: CGPoint(x: 207.82, y: 216.39), controlPoint1: CGPoint(x: 206.58, y: 218), controlPoint2: CGPoint(x: 207.46, y: 217.34))
        shape.addLine(to: CGPoint(x: 212.26, y: 204.71))
        shape.addCurve(to: CGPoint(x: 216.96, y: 204.24), controlPoint1: CGPoint(x: 213.04, y: 202.66), controlPoint2: CGPoint(x: 215.81, y: 202.39))
        shape.addLine(to: CGPoint(x: 279.77, y: 304.88))
        shape.addCurve(to: CGPoint(x: 280.17, y: 306.34), controlPoint1: CGPoint(x: 280.04, y: 305.32), controlPoint2: CGPoint(x: 280.18, y: 305.83))
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

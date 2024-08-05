//
//  OnboardingMap_경기도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_경기도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 183.2, y: 281.06))
        shape.addCurve(to: CGPoint(x: 175.38, y: 277.78), controlPoint1: CGPoint(x: 177.75, y: 281.06), controlPoint2: CGPoint(x: 175.96, y: 279.73))
        shape.addLine(to: CGPoint(x: 172.51, y: 268.23))
        shape.addCurve(to: CGPoint(x: 172.66, y: 265.15), controlPoint1: CGPoint(x: 172.21, y: 267.22), controlPoint2: CGPoint(x: 172.26, y: 266.13))
        shape.addLine(to: CGPoint(x: 177.14, y: 254.28))
        shape.addCurve(to: CGPoint(x: 175.58, y: 248.78), controlPoint1: CGPoint(x: 177.95, y: 252.3), controlPoint2: CGPoint(x: 177.31, y: 250.02))
        shape.addLine(to: CGPoint(x: 147.87, y: 228.82))
        shape.addLine(to: CGPoint(x: 124.78, y: 258.16))
        shape.addCurve(to: CGPoint(x: 122.46, y: 259.16), controlPoint1: CGPoint(x: 124.22, y: 258.87), controlPoint2: CGPoint(x: 123.35, y: 259.24))
        shape.addLine(to: CGPoint(x: 111.74, y: 258.14))
        shape.addCurve(to: CGPoint(x: 108.86, y: 260.99), controlPoint1: CGPoint(x: 110.1, y: 257.99), controlPoint2: CGPoint(x: 108.73, y: 259.35))
        shape.addLine(to: CGPoint(x: 109.56, y: 269.58))
        shape.addCurve(to: CGPoint(x: 112.19, y: 272.02), controlPoint1: CGPoint(x: 109.68, y: 270.96), controlPoint2: CGPoint(x: 110.82, y: 272.02))
        shape.addCurve(to: CGPoint(x: 119.06, y: 273.12), controlPoint1: CGPoint(x: 117.79, y: 272.02), controlPoint2: CGPoint(x: 118.58, y: 272.45))
        shape.addLine(to: CGPoint(x: 124.16, y: 269.73))
        shape.addCurve(to: CGPoint(x: 127.32, y: 269.67), controlPoint1: CGPoint(x: 125.11, y: 269.09), controlPoint2: CGPoint(x: 126.34, y: 269.07))
        shape.addLine(to: CGPoint(x: 130.12, y: 271.38))
        shape.addCurve(to: CGPoint(x: 131.51, y: 274.27), controlPoint1: CGPoint(x: 131.11, y: 271.99), controlPoint2: CGPoint(x: 131.65, y: 273.11))
        shape.addLine(to: CGPoint(x: 129.98, y: 286.33))
        shape.addCurve(to: CGPoint(x: 128.55, y: 288.5), controlPoint1: CGPoint(x: 129.87, y: 287.24), controlPoint2: CGPoint(x: 129.34, y: 288.04))
        shape.addLine(to: CGPoint(x: 123.69, y: 291.36))
        shape.addLine(to: CGPoint(x: 126.21, y: 292.54))
        shape.addCurve(to: CGPoint(x: 126.53, y: 297.15), controlPoint1: CGPoint(x: 128.09, y: 293.42), controlPoint2: CGPoint(x: 128.27, y: 296.03))
        shape.addLine(to: CGPoint(x: 123.16, y: 299.34))
        shape.addCurve(to: CGPoint(x: 122.53, y: 303.21), controlPoint1: CGPoint(x: 121.85, y: 300.19), controlPoint2: CGPoint(x: 121.56, y: 301.98))
        shape.addLine(to: CGPoint(x: 125.37, y: 306.8))
        shape.addCurve(to: CGPoint(x: 125.71, y: 309.53), controlPoint1: CGPoint(x: 126.04, y: 307.64), controlPoint2: CGPoint(x: 126.09, y: 308.68))
        shape.addLine(to: CGPoint(x: 146.22, y: 314.7))
        shape.addCurve(to: CGPoint(x: 148.74, y: 316.36), controlPoint1: CGPoint(x: 147.22, y: 314.95), controlPoint2: CGPoint(x: 148.12, y: 315.54))
        shape.addLine(to: CGPoint(x: 151.96, y: 320.56))
        shape.addCurve(to: CGPoint(x: 155.47, y: 322.36), controlPoint1: CGPoint(x: 152.83, y: 321.7), controlPoint2: CGPoint(x: 154.14, y: 322.32))
        shape.addCurve(to: CGPoint(x: 158.38, y: 321.42), controlPoint1: CGPoint(x: 156.48, y: 322.39), controlPoint2: CGPoint(x: 157.51, y: 322.08))
        shape.addLine(to: CGPoint(x: 181.03, y: 304.14))
        shape.addLine(to: CGPoint(x: 182.45, y: 303.05))
        shape.addCurve(to: CGPoint(x: 184.12, y: 300.53), controlPoint1: CGPoint(x: 183.27, y: 302.42), controlPoint2: CGPoint(x: 183.86, y: 301.54))
        shape.addLine(to: CGPoint(x: 187.64, y: 286.81))
        shape.addCurve(to: CGPoint(x: 183.2, y: 281.06), controlPoint1: CGPoint(x: 188.39, y: 283.89), controlPoint2: CGPoint(x: 186.2, y: 281.06))
        shape.close()
        shape.move(to: CGPoint(x: 155.67, y: 279.03))
        shape.addLine(to: CGPoint(x: 150.91, y: 283.42))
        shape.addCurve(to: CGPoint(x: 148.47, y: 283.67), controlPoint1: CGPoint(x: 150.25, y: 284.04), controlPoint2: CGPoint(x: 149.25, y: 284.14))
        shape.addLine(to: CGPoint(x: 145.09, y: 281.66))
        shape.addCurve(to: CGPoint(x: 143.04, y: 281.63), controlPoint1: CGPoint(x: 144.46, y: 281.29), controlPoint2: CGPoint(x: 143.68, y: 281.28))
        shape.addLine(to: CGPoint(x: 140.29, y: 283.16))
        shape.addCurve(to: CGPoint(x: 137.31, y: 281.86), controlPoint1: CGPoint(x: 139.11, y: 283.81), controlPoint2: CGPoint(x: 137.63, y: 283.17))
        shape.addLine(to: CGPoint(x: 135.66, y: 275.38))
        shape.addCurve(to: CGPoint(x: 137.06, y: 272.89), controlPoint1: CGPoint(x: 135.39, y: 274.3), controlPoint2: CGPoint(x: 136.01, y: 273.21))
        shape.addCurve(to: CGPoint(x: 137.96, y: 272.34), controlPoint1: CGPoint(x: 137.41, y: 272.79), controlPoint2: CGPoint(x: 137.72, y: 272.6))
        shape.addLine(to: CGPoint(x: 143.18, y: 266.87))
        shape.addCurve(to: CGPoint(x: 144.67, y: 266.23), controlPoint1: CGPoint(x: 143.57, y: 266.46), controlPoint2: CGPoint(x: 144.11, y: 266.23))
        shape.addCurve(to: CGPoint(x: 152.29, y: 268.3), controlPoint1: CGPoint(x: 151.37, y: 266.23), controlPoint2: CGPoint(x: 152.29, y: 267.15))
        shape.addLine(to: CGPoint(x: 155.5, y: 275.86))
        shape.addCurve(to: CGPoint(x: 155.67, y: 279.03), controlPoint1: CGPoint(x: 156.54, y: 276.63), controlPoint2: CGPoint(x: 156.62, y: 278.15))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.layer.addSublayer(shapeLayer)
    }
}

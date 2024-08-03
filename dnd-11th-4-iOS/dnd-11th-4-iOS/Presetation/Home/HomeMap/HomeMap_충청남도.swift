//
//  HomeMap_충청남도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_충청남도: UIView, DrawMapProtocol {
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
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
        
        // MARK: - 충청남도
        
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 172.81, y: 412.34))
        shape.addCurve(to: CGPoint(x: 156.53, y: 415.2), controlPoint1: CGPoint(x: 168.78, y: 416.58), controlPoint2: CGPoint(x: 161.44, y: 418.4))
        shape.addLine(to: CGPoint(x: 146.14, y: 408.4))
        shape.addCurve(to: CGPoint(x: 128.34, y: 405.99), controlPoint1: CGPoint(x: 140.88, y: 404.95), controlPoint2: CGPoint(x: 134.33, y: 404.06))
        shape.addLine(to: CGPoint(x: 82.6, y: 420.74))
        shape.addLine(to: CGPoint(x: 63.09, y: 347.29))
        shape.addCurve(to: CGPoint(x: 58.98, y: 344.12), controlPoint1: CGPoint(x: 62.6, y: 345.43), controlPoint2: CGPoint(x: 60.91, y: 344.12))
        shape.addCurve(to: CGPoint(x: 47.5, y: 342.72), controlPoint1: CGPoint(x: 49.46, y: 344.12), controlPoint2: CGPoint(x: 48.31, y: 343.61))
        shape.addLine(to: CGPoint(x: 34.54, y: 328.35))
        shape.addCurve(to: CGPoint(x: 34.96, y: 322.23), controlPoint1: CGPoint(x: 32.92, y: 326.56), controlPoint2: CGPoint(x: 33.12, y: 323.78))
        shape.addLine(to: CGPoint(x: 61.19, y: 300.38))
        shape.addCurve(to: CGPoint(x: 63.63, y: 299.41), controlPoint1: CGPoint(x: 61.88, y: 299.81), controlPoint2: CGPoint(x: 62.73, y: 299.46))
        shape.addLine(to: CGPoint(x: 82.96, y: 298.16))
        shape.addCurve(to: CGPoint(x: 86.57, y: 295.66), controlPoint1: CGPoint(x: 84.67, y: 298.04), controlPoint2: CGPoint(x: 85.96, y: 297.01))
        shape.addLine(to: CGPoint(x: 119.64, y: 303.98))
        shape.addCurve(to: CGPoint(x: 123.71, y: 306.65), controlPoint1: CGPoint(x: 121.26, y: 304.39), controlPoint2: CGPoint(x: 122.7, y: 305.33))
        shape.addLine(to: CGPoint(x: 128.89, y: 313.4))
        shape.addCurve(to: CGPoint(x: 134.55, y: 316.3), controlPoint1: CGPoint(x: 130.3, y: 315.23), controlPoint2: CGPoint(x: 132.4, y: 316.23))
        shape.addLine(to: CGPoint(x: 144.26, y: 326.85))
        shape.addCurve(to: CGPoint(x: 146.03, y: 334.1), controlPoint1: CGPoint(x: 146.56, y: 328.5), controlPoint2: CGPoint(x: 147.32, y: 331.58))
        shape.addLine(to: CGPoint(x: 143.83, y: 338.44))
        shape.addCurve(to: CGPoint(x: 143.61, y: 343.14), controlPoint1: CGPoint(x: 143.07, y: 339.93), controlPoint2: CGPoint(x: 143.02, y: 341.65))
        shape.addLine(to: CGPoint(x: 138.1, y: 340.36))
        shape.addCurve(to: CGPoint(x: 131.32, y: 345.52), controlPoint1: CGPoint(x: 134.58, y: 338.59), controlPoint2: CGPoint(x: 130.56, y: 341.65))
        shape.addLine(to: CGPoint(x: 134.53, y: 361.66))
        shape.addCurve(to: CGPoint(x: 137.82, y: 365.28), controlPoint1: CGPoint(x: 134.88, y: 363.47), controlPoint2: CGPoint(x: 136.21, y: 364.8))
        shape.addCurve(to: CGPoint(x: 141.69, y: 387.86), controlPoint1: CGPoint(x: 137.82, y: 383.8), controlPoint2: CGPoint(x: 139.29, y: 386.4))
        shape.addLine(to: CGPoint(x: 146.22, y: 390.6))
        shape.addCurve(to: CGPoint(x: 155.45, y: 389.97), controlPoint1: CGPoint(x: 149.12, y: 392.35), controlPoint2: CGPoint(x: 152.81, y: 392.11))
        shape.addLine(to: CGPoint(x: 158.7, y: 387.23))
        shape.addCurve(to: CGPoint(x: 159.34, y: 389.42), controlPoint1: CGPoint(x: 158.76, y: 387.99), controlPoint2: CGPoint(x: 158.97, y: 388.74))
        shape.addLine(to: CGPoint(x: 170.06, y: 409.78))
        shape.addCurve(to: CGPoint(x: 172.81, y: 412.34), controlPoint1: CGPoint(x: 170.68, y: 410.95), controlPoint2: CGPoint(x: 171.66, y: 411.84))
        shape.close()
        
        
        // MARK: - 세종
        
        shape.move(to: CGPoint(x: 158.37, y: 357.75))
        shape.addLine(to: CGPoint(x: 141.03, y: 365.1))
        shape.addCurve(to: CGPoint(x: 137.82, y: 365.28), controlPoint1: CGPoint(x: 139.96, y: 365.56), controlPoint2: CGPoint(x: 138.83, y: 365.58))
        shape.addCurve(to: CGPoint(x: 134.53, y: 361.66), controlPoint1: CGPoint(x: 136.21, y: 364.8), controlPoint2: CGPoint(x: 134.88, y: 363.47))
        shape.addLine(to: CGPoint(x: 131.32, y: 345.52))
        shape.addCurve(to: CGPoint(x: 138.1, y: 340.36), controlPoint1: CGPoint(x: 130.56, y: 341.65), controlPoint2: CGPoint(x: 134.58, y: 338.59))
        shape.addLine(to: CGPoint(x: 143.61, y: 343.14))
        shape.addCurve(to: CGPoint(x: 145.01, y: 345.21), controlPoint1: CGPoint(x: 143.91, y: 343.9), controlPoint2: CGPoint(x: 144.39, y: 344.61))
        shape.addLine(to: CGPoint(x: 158.37, y: 357.75))
        
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.mapBackground.cgColor
        shapeLayer.fillColor = UIColor.mapGray.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
    }
}

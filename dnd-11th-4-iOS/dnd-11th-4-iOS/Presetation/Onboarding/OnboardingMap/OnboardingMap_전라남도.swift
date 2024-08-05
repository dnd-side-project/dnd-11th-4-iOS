//
//  OnboardingMap_전라남도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_전라남도: UIView, DrawMapProtocol {
    
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
        
        // MARK: - 전라남도
        
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 180.47, y: 449.38))
        shape.addCurve(to: CGPoint(x: 178.37, y: 445.42), controlPoint1: CGPoint(x: 179.32, y: 448.36), controlPoint2: CGPoint(x: 178.57, y: 446.95))
        shape.addLine(to: CGPoint(x: 176.88, y: 434.11))
        shape.addCurve(to: CGPoint(x: 174.15, y: 434.86), controlPoint1: CGPoint(x: 176.12, y: 434.65), controlPoint2: CGPoint(x: 175.17, y: 434.94))
        shape.addLine(to: CGPoint(x: 149.67, y: 432.92))
        shape.addCurve(to: CGPoint(x: 145.81, y: 428.73), controlPoint1: CGPoint(x: 147.49, y: 432.75), controlPoint2: CGPoint(x: 145.81, y: 430.92))
        shape.addCurve(to: CGPoint(x: 143.77, y: 421.2), controlPoint1: CGPoint(x: 145.81, y: 423.33), controlPoint2: CGPoint(x: 145.03, y: 421.96))
        shape.addLine(to: CGPoint(x: 135.62, y: 416.3))
        shape.addCurve(to: CGPoint(x: 129.71, y: 418.01), controlPoint1: CGPoint(x: 133.53, y: 415.04), controlPoint2: CGPoint(x: 130.81, y: 415.83))
        shape.addLine(to: CGPoint(x: 125.3, y: 426.79))
        shape.addCurve(to: CGPoint(x: 119.35, y: 428.49), controlPoint1: CGPoint(x: 124.19, y: 429), controlPoint2: CGPoint(x: 121.45, y: 429.78))
        shape.addLine(to: CGPoint(x: 110.49, y: 423.03))
        shape.addLine(to: CGPoint(x: 94.38, y: 453.28))
        shape.addCurve(to: CGPoint(x: 94.56, y: 456.07), controlPoint1: CGPoint(x: 93.91, y: 454.17), controlPoint2: CGPoint(x: 93.98, y: 455.25))
        shape.addLine(to: CGPoint(x: 101.48, y: 465.77))
        shape.addCurve(to: CGPoint(x: 101.82, y: 468.16), controlPoint1: CGPoint(x: 101.97, y: 466.47), controlPoint2: CGPoint(x: 102.1, y: 467.35))
        shape.addLine(to: CGPoint(x: 99.14, y: 476.01))
        shape.addCurve(to: CGPoint(x: 100.09, y: 479.01), controlPoint1: CGPoint(x: 98.77, y: 477.11), controlPoint2: CGPoint(x: 99.15, y: 478.33))
        shape.addLine(to: CGPoint(x: 109.25, y: 485.67))
        shape.addCurve(to: CGPoint(x: 110.27, y: 487.22), controlPoint1: CGPoint(x: 109.77, y: 486.04), controlPoint2: CGPoint(x: 110.13, y: 486.59))
        shape.addLine(to: CGPoint(x: 112.58, y: 497.33))
        shape.addCurve(to: CGPoint(x: 115.95, y: 499.26), controlPoint1: CGPoint(x: 112.92, y: 498.83), controlPoint2: CGPoint(x: 114.48, y: 499.72))
        shape.addLine(to: CGPoint(x: 140.05, y: 491.62))
        shape.addCurve(to: CGPoint(x: 141.82, y: 489.7), controlPoint1: CGPoint(x: 140.94, y: 491.33), controlPoint2: CGPoint(x: 141.61, y: 490.61))
        shape.addLine(to: CGPoint(x: 145.48, y: 474.06))
        shape.addCurve(to: CGPoint(x: 147.16, y: 472.17), controlPoint1: CGPoint(x: 145.68, y: 473.19), controlPoint2: CGPoint(x: 146.31, y: 472.48))
        shape.addLine(to: CGPoint(x: 189.27, y: 457.11))
        shape.addLine(to: CGPoint(x: 180.47, y: 449.38))
        shape.close()
        shape.move(to: CGPoint(x: 142.37, y: 447.46))
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
        shape.addCurve(to: CGPoint(x: 142.37, y: 447.46), controlPoint1: CGPoint(x: 145.95, y: 444.05), controlPoint2: CGPoint(x: 144.78, y: 446.8))
        shape.close()
        
        // MARK: - 고흥
        
        shape.move(to: CGPoint(x: 169.38, y: 483.42))
        shape.addLine(to: CGPoint(x: 162.41, y: 488.9))
        shape.addCurve(to: CGPoint(x: 160.17, y: 489.22), controlPoint1: CGPoint(x: 161.77, y: 489.41), controlPoint2: CGPoint(x: 160.91, y: 489.53))
        shape.addLine(to: CGPoint(x: 151.18, y: 485.48))
        shape.addCurve(to: CGPoint(x: 150.07, y: 482.3), controlPoint1: CGPoint(x: 149.93, y: 484.97), controlPoint2: CGPoint(x: 149.42, y: 483.47))
        shape.addLine(to: CGPoint(x: 154.01, y: 475.3))
        shape.addCurve(to: CGPoint(x: 155.81, y: 474.17), controlPoint1: CGPoint(x: 154.38, y: 474.65), controlPoint2: CGPoint(x: 155.06, y: 474.22))
        shape.addLine(to: CGPoint(x: 165.27, y: 473.49))
        shape.addCurve(to: CGPoint(x: 167.49, y: 474.84), controlPoint1: CGPoint(x: 166.22, y: 473.42), controlPoint2: CGPoint(x: 167.11, y: 473.97))
        shape.addLine(to: CGPoint(x: 170.06, y: 480.75))
        shape.addCurve(to: CGPoint(x: 169.38, y: 483.42), controlPoint1: CGPoint(x: 170.46, y: 481.69), controlPoint2: CGPoint(x: 170.19, y: 482.79))
        shape.close()
        
        // MARK: - 진도
        
        shape.move(to: CGPoint(x: 104.24, y: 490.55))
        shape.addLine(to: CGPoint(x: 103.24, y: 494.58))
        shape.addCurve(to: CGPoint(x: 100.42, y: 497.02), controlPoint1: CGPoint(x: 102.92, y: 495.91), controlPoint2: CGPoint(x: 101.79, y: 496.89))
        shape.addLine(to: CGPoint(x: 93.99, y: 497.64))
        shape.addCurve(to: CGPoint(x: 91.09, y: 496.35), controlPoint1: CGPoint(x: 92.86, y: 497.75), controlPoint2: CGPoint(x: 91.76, y: 497.26))
        shape.addLine(to: CGPoint(x: 90.85, y: 496.02))
        shape.addCurve(to: CGPoint(x: 91.03, y: 491.95), controlPoint1: CGPoint(x: 89.94, y: 494.79), controlPoint2: CGPoint(x: 90.01, y: 493.09))
        shape.addLine(to: CGPoint(x: 96.54, y: 485.74))
        shape.addCurve(to: CGPoint(x: 101.06, y: 485.45), controlPoint1: CGPoint(x: 97.71, y: 484.42), controlPoint2: CGPoint(x: 99.73, y: 484.29))
        shape.addLine(to: CGPoint(x: 103.23, y: 487.34))
        shape.addCurve(to: CGPoint(x: 104.24, y: 490.55), controlPoint1: CGPoint(x: 104.14, y: 488.13), controlPoint2: CGPoint(x: 104.53, y: 489.37))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        self.layer.addSublayer(shapeLayer)
    }
}

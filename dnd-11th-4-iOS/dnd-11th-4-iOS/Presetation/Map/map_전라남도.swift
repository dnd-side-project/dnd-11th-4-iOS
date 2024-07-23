//
//  map_전라남도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class map_전라남도: UIView, DrawMapProtocol {
    
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
        // MARK: - 전라남도
        
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 174.87, y: 520.57))
        shape.addCurve(to: CGPoint(x: 171.47, y: 514.2), controlPoint1: CGPoint(x: 173, y: 518.93), controlPoint2: CGPoint(x: 171.8, y: 516.66))
        shape.addLine(to: CGPoint(x: 169.08, y: 496.02))
        shape.addCurve(to: CGPoint(x: 164.67, y: 497.22), controlPoint1: CGPoint(x: 167.85, y: 496.88), controlPoint2: CGPoint(x: 166.31, y: 497.35))
        shape.addLine(to: CGPoint(x: 125.21, y: 494.11))
        shape.addCurve(to: CGPoint(x: 118.97, y: 487.36), controlPoint1: CGPoint(x: 121.69, y: 493.82), controlPoint2: CGPoint(x: 118.97, y: 490.88))
        shape.addCurve(to: CGPoint(x: 115.69, y: 475.25), controlPoint1: CGPoint(x: 118.97, y: 478.67), controlPoint2: CGPoint(x: 117.73, y: 476.47))
        shape.addLine(to: CGPoint(x: 102.56, y: 467.37))
        shape.addCurve(to: CGPoint(x: 93.03, y: 470.12), controlPoint1: CGPoint(x: 99.18, y: 465.34), controlPoint2: CGPoint(x: 94.8, y: 466.62))
        shape.addLine(to: CGPoint(x: 85.91, y: 484.24))
        shape.addCurve(to: CGPoint(x: 76.33, y: 486.97), controlPoint1: CGPoint(x: 84.13, y: 487.79), controlPoint2: CGPoint(x: 79.7, y: 489.04))
        shape.addLine(to: CGPoint(x: 62.04, y: 478.2))
        shape.addLine(to: CGPoint(x: 36.07, y: 526.85))
        shape.addCurve(to: CGPoint(x: 36.36, y: 531.33), controlPoint1: CGPoint(x: 35.3, y: 528.28), controlPoint2: CGPoint(x: 35.42, y: 530.01))
        shape.addLine(to: CGPoint(x: 47.5, y: 546.92))
        shape.addCurve(to: CGPoint(x: 48.06, y: 550.78), controlPoint1: CGPoint(x: 48.29, y: 548.04), controlPoint2: CGPoint(x: 48.5, y: 549.48))
        shape.addLine(to: CGPoint(x: 43.74, y: 563.4))
        shape.addCurve(to: CGPoint(x: 45.27, y: 568.22), controlPoint1: CGPoint(x: 43.14, y: 565.16), controlPoint2: CGPoint(x: 43.76, y: 567.12))
        shape.addLine(to: CGPoint(x: 60.03, y: 578.92))
        shape.addCurve(to: CGPoint(x: 61.68, y: 581.42), controlPoint1: CGPoint(x: 60.87, y: 579.52), controlPoint2: CGPoint(x: 61.45, y: 580.42))
        shape.addLine(to: CGPoint(x: 65.4, y: 597.68))
        shape.addCurve(to: CGPoint(x: 70.84, y: 600.78), controlPoint1: CGPoint(x: 65.96, y: 600.1), controlPoint2: CGPoint(x: 68.47, y: 601.53))
        shape.addLine(to: CGPoint(x: 109.7, y: 588.49))
        shape.addCurve(to: CGPoint(x: 112.56, y: 585.4), controlPoint1: CGPoint(x: 111.13, y: 588.04), controlPoint2: CGPoint(x: 112.21, y: 586.87))
        shape.addLine(to: CGPoint(x: 118.45, y: 560.26))
        shape.addCurve(to: CGPoint(x: 121.16, y: 557.22), controlPoint1: CGPoint(x: 118.77, y: 558.85), controlPoint2: CGPoint(x: 119.79, y: 557.72))
        shape.addLine(to: CGPoint(x: 189.04, y: 533))
        shape.addLine(to: CGPoint(x: 174.87, y: 520.57))
        shape.close()
        shape.move(to: CGPoint(x: 113.44, y: 517.49))
        shape.addLine(to: CGPoint(x: 94.51, y: 522.66))
        shape.addCurve(to: CGPoint(x: 88.52, y: 521.12), controlPoint1: CGPoint(x: 92.38, y: 523.24), controlPoint2: CGPoint(x: 90.1, y: 522.66))
        shape.addLine(to: CGPoint(x: 85.84, y: 518.54))
        shape.addCurve(to: CGPoint(x: 84.56, y: 511.33), controlPoint1: CGPoint(x: 83.9, y: 516.66), controlPoint2: CGPoint(x: 83.39, y: 513.76))
        shape.addLine(to: CGPoint(x: 89.7, y: 500.65))
        shape.addCurve(to: CGPoint(x: 94.2, y: 497.22), controlPoint1: CGPoint(x: 90.57, y: 498.86), controlPoint2: CGPoint(x: 92.24, y: 497.58))
        shape.addLine(to: CGPoint(x: 102.89, y: 495.64))
        shape.addCurve(to: CGPoint(x: 108.66, y: 497.6), controlPoint1: CGPoint(x: 105.03, y: 495.24), controlPoint2: CGPoint(x: 107.21, y: 495.99))
        shape.addLine(to: CGPoint(x: 115, y: 504.66))
        shape.addCurve(to: CGPoint(x: 115.83, y: 505.83), controlPoint1: CGPoint(x: 115.32, y: 505.02), controlPoint2: CGPoint(x: 115.61, y: 505.41))
        shape.addLine(to: CGPoint(x: 117.27, y: 508.46))
        shape.addCurve(to: CGPoint(x: 113.44, y: 517.49), controlPoint1: CGPoint(x: 119.2, y: 512), controlPoint2: CGPoint(x: 117.33, y: 516.42))
        shape.close()
        
        // MARK: - 고흥
        
        shape.move(to: CGPoint(x: 156.99, y: 575.31))
        shape.addLine(to: CGPoint(x: 145.74, y: 584.13))
        shape.addCurve(to: CGPoint(x: 142.13, y: 584.63), controlPoint1: CGPoint(x: 144.71, y: 584.94), controlPoint2: CGPoint(x: 143.33, y: 585.13))
        shape.addLine(to: CGPoint(x: 127.63, y: 578.63))
        shape.addCurve(to: CGPoint(x: 125.86, y: 573.5), controlPoint1: CGPoint(x: 125.62, y: 577.8), controlPoint2: CGPoint(x: 124.79, y: 575.4))
        shape.addLine(to: CGPoint(x: 132.19, y: 562.26))
        shape.addCurve(to: CGPoint(x: 135.1, y: 560.43), controlPoint1: CGPoint(x: 132.79, y: 561.2), controlPoint2: CGPoint(x: 133.89, y: 560.51))
        shape.addLine(to: CGPoint(x: 150.36, y: 559.35))
        shape.addCurve(to: CGPoint(x: 153.94, y: 561.51), controlPoint1: CGPoint(x: 151.89, y: 559.24), controlPoint2: CGPoint(x: 153.33, y: 560.11))
        shape.addLine(to: CGPoint(x: 158.07, y: 571.02))
        shape.addCurve(to: CGPoint(x: 156.99, y: 575.31), controlPoint1: CGPoint(x: 158.73, y: 572.53), controlPoint2: CGPoint(x: 158.28, y: 574.3))
        shape.close()
        
        // MARK: - 진도
        shape.move(to: CGPoint(x: 51.95, y: 586.78))
        shape.addLine(to: CGPoint(x: 50.35, y: 593.26))
        shape.addCurve(to: CGPoint(x: 45.81, y: 597.18), controlPoint1: CGPoint(x: 49.82, y: 595.39), controlPoint2: CGPoint(x: 48, y: 596.97))
        shape.addLine(to: CGPoint(x: 35.43, y: 598.18))
        shape.addCurve(to: CGPoint(x: 30.76, y: 596.11), controlPoint1: CGPoint(x: 33.62, y: 598.35), controlPoint2: CGPoint(x: 31.84, y: 597.56))
        shape.addLine(to: CGPoint(x: 30.37, y: 595.58))
        shape.addCurve(to: CGPoint(x: 30.66, y: 589.02), controlPoint1: CGPoint(x: 28.9, y: 593.6), controlPoint2: CGPoint(x: 29.02, y: 590.86))
        shape.addLine(to: CGPoint(x: 39.54, y: 579.04))
        shape.addCurve(to: CGPoint(x: 46.84, y: 578.58), controlPoint1: CGPoint(x: 41.44, y: 576.92), controlPoint2: CGPoint(x: 44.69, y: 576.71))
        shape.addLine(to: CGPoint(x: 50.32, y: 581.61))
        shape.addCurve(to: CGPoint(x: 51.95, y: 586.78), controlPoint1: CGPoint(x: 51.79, y: 582.89), controlPoint2: CGPoint(x: 52.43, y: 584.89))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
    }
    
    
}

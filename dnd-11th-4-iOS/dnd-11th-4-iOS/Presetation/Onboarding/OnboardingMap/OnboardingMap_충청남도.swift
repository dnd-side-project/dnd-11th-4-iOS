//
//  OnboardingMap_충청남도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_충청남도: UIView, DrawMapProtocol {
    
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
        
        // MARK: - 충청남도
        
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 179.2, y: 382.08))
        shape.addCurve(to: CGPoint(x: 169.1, y: 383.86), controlPoint1: CGPoint(x: 176.7, y: 384.72), controlPoint2: CGPoint(x: 172.15, y: 385.85))
        shape.addLine(to: CGPoint(x: 162.66, y: 379.63))
        shape.addCurve(to: CGPoint(x: 151.62, y: 378.14), controlPoint1: CGPoint(x: 159.39, y: 377.48), controlPoint2: CGPoint(x: 155.33, y: 376.94))
        shape.addLine(to: CGPoint(x: 123.25, y: 387.3))
        shape.addLine(to: CGPoint(x: 111.14, y: 341.63))
        shape.addCurve(to: CGPoint(x: 108.6, y: 339.66), controlPoint1: CGPoint(x: 110.84, y: 340.47), controlPoint2: CGPoint(x: 109.79, y: 339.66))
        shape.addCurve(to: CGPoint(x: 101.48, y: 338.79), controlPoint1: CGPoint(x: 102.69, y: 339.66), controlPoint2: CGPoint(x: 101.98, y: 339.35))
        shape.addLine(to: CGPoint(x: 93.43, y: 329.86))
        shape.addCurve(to: CGPoint(x: 93.7, y: 326.05), controlPoint1: CGPoint(x: 92.43, y: 328.74), controlPoint2: CGPoint(x: 92.55, y: 327.01))
        shape.addLine(to: CGPoint(x: 109.96, y: 312.46))
        shape.addCurve(to: CGPoint(x: 111.48, y: 311.86), controlPoint1: CGPoint(x: 110.39, y: 312.11), controlPoint2: CGPoint(x: 110.92, y: 311.89))
        shape.addLine(to: CGPoint(x: 123.47, y: 311.08))
        shape.addCurve(to: CGPoint(x: 125.71, y: 309.53), controlPoint1: CGPoint(x: 124.53, y: 311.01), controlPoint2: CGPoint(x: 125.33, y: 310.37))
        shape.addLine(to: CGPoint(x: 146.22, y: 314.7))
        shape.addCurve(to: CGPoint(x: 148.74, y: 316.36), controlPoint1: CGPoint(x: 147.22, y: 314.95), controlPoint2: CGPoint(x: 148.12, y: 315.54))
        shape.addLine(to: CGPoint(x: 151.96, y: 320.56))
        shape.addCurve(to: CGPoint(x: 155.47, y: 322.36), controlPoint1: CGPoint(x: 152.83, y: 321.7), controlPoint2: CGPoint(x: 154.14, y: 322.32))
        shape.addLine(to: CGPoint(x: 161.49, y: 328.92))
        shape.addCurve(to: CGPoint(x: 162.59, y: 333.43), controlPoint1: CGPoint(x: 162.92, y: 329.95), controlPoint2: CGPoint(x: 163.39, y: 331.86))
        shape.addLine(to: CGPoint(x: 161.22, y: 336.13))
        shape.addCurve(to: CGPoint(x: 161.09, y: 339.05), controlPoint1: CGPoint(x: 160.75, y: 337.06), controlPoint2: CGPoint(x: 160.72, y: 338.12))
        shape.addLine(to: CGPoint(x: 157.67, y: 337.32))
        shape.addCurve(to: CGPoint(x: 153.46, y: 340.53), controlPoint1: CGPoint(x: 155.49, y: 336.22), controlPoint2: CGPoint(x: 152.99, y: 338.12))
        shape.addLine(to: CGPoint(x: 155.45, y: 350.57))
        shape.addCurve(to: CGPoint(x: 157.5, y: 352.82), controlPoint1: CGPoint(x: 155.67, y: 351.69), controlPoint2: CGPoint(x: 156.5, y: 352.52))
        shape.addCurve(to: CGPoint(x: 159.9, y: 366.86), controlPoint1: CGPoint(x: 157.5, y: 364.33), controlPoint2: CGPoint(x: 158.41, y: 365.95))
        shape.addLine(to: CGPoint(x: 162.7, y: 368.56))
        shape.addCurve(to: CGPoint(x: 168.43, y: 368.17), controlPoint1: CGPoint(x: 164.5, y: 369.65), controlPoint2: CGPoint(x: 166.79, y: 369.5))
        shape.addLine(to: CGPoint(x: 170.45, y: 366.47))
        shape.addCurve(to: CGPoint(x: 170.84, y: 367.83), controlPoint1: CGPoint(x: 170.49, y: 366.94), controlPoint2: CGPoint(x: 170.61, y: 367.41))
        shape.addLine(to: CGPoint(x: 177.49, y: 380.49))
        shape.addCurve(to: CGPoint(x: 179.2, y: 382.08), controlPoint1: CGPoint(x: 177.88, y: 381.22), controlPoint2: CGPoint(x: 178.49, y: 381.77))
        shape.close()
        
        // MARK: - 세종
        
        shape.move(to: CGPoint(x: 170.24, y: 348.14))
        shape.addLine(to: CGPoint(x: 159.48, y: 352.71))
        shape.addCurve(to: CGPoint(x: 157.5, y: 352.82), controlPoint1: CGPoint(x: 158.82, y: 352.99), controlPoint2: CGPoint(x: 158.12, y: 353.01))
        shape.addCurve(to: CGPoint(x: 155.45, y: 350.57), controlPoint1: CGPoint(x: 156.5, y: 352.52), controlPoint2: CGPoint(x: 155.67, y: 351.69))
        shape.addLine(to: CGPoint(x: 153.46, y: 340.53))
        shape.addCurve(to: CGPoint(x: 157.67, y: 337.32), controlPoint1: CGPoint(x: 152.99, y: 338.12), controlPoint2: CGPoint(x: 155.49, y: 336.22))
        shape.addLine(to: CGPoint(x: 161.09, y: 339.05))
        shape.addCurve(to: CGPoint(x: 161.96, y: 340.34), controlPoint1: CGPoint(x: 161.27, y: 339.53), controlPoint2: CGPoint(x: 161.57, y: 339.97))
        shape.addLine(to: CGPoint(x: 170.24, y: 348.14))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.layer.addSublayer(shapeLayer)
    }
}



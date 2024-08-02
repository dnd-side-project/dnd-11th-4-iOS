//
//  OnboardingMap_제주도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_제주도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 136.49, y: 530.3))
        shape.addLine(to: CGPoint(x: 130.01, y: 536.33))
        shape.addCurve(to: CGPoint(x: 128.01, y: 537.43), controlPoint1: CGPoint(x: 129.45, y: 536.86), controlPoint2: CGPoint(x: 128.76, y: 537.23))
        shape.addLine(to: CGPoint(x: 100.62, y: 544.44))
        shape.addCurve(to: CGPoint(x: 95.93, y: 542.91), controlPoint1: CGPoint(x: 98.89, y: 544.87), controlPoint2: CGPoint(x: 97.06, y: 544.28))
        shape.addLine(to: CGPoint(x: 92.75, y: 539.09))
        shape.addCurve(to: CGPoint(x: 92.82, y: 533.07), controlPoint1: CGPoint(x: 91.29, y: 537.34), controlPoint2: CGPoint(x: 91.33, y: 534.79))
        shape.addLine(to: CGPoint(x: 99.94, y: 524.93))
        shape.addCurve(to: CGPoint(x: 102.67, y: 523.42), controlPoint1: CGPoint(x: 100.65, y: 524.13), controlPoint2: CGPoint(x: 101.61, y: 523.6))
        shape.addLine(to: CGPoint(x: 126.97, y: 519.39))
        shape.addCurve(to: CGPoint(x: 129.88, y: 519.86), controlPoint1: CGPoint(x: 127.97, y: 519.22), controlPoint2: CGPoint(x: 128.98, y: 519.39))
        shape.addLine(to: CGPoint(x: 135.49, y: 522.82))
        shape.addCurve(to: CGPoint(x: 136.49, y: 530.3), controlPoint1: CGPoint(x: 138.31, y: 524.3), controlPoint2: CGPoint(x: 138.82, y: 528.14))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        self.layer.addSublayer(shapeLayer)
    }
}

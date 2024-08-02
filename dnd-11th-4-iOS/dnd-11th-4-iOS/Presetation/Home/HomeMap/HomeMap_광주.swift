//
//  HomeMap_광주.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_광주: UIView, DrawMapProtocol {
    
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
        let shape = UIBezierPath()
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
        shape.addCurve(to: CGPoint(x: 115.83, y: 505.83), controlPoint1: CGPoint(x: 115.32, y: 505.02), controlPoint2: CGPoint(x: 115.61, y: 505.42))
        shape.addLine(to: CGPoint(x: 117.27, y: 508.47))
        shape.addCurve(to: CGPoint(x: 113.44, y: 517.49), controlPoint1: CGPoint(x: 119.2, y: 512), controlPoint2: CGPoint(x: 117.33, y: 516.42))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    
}

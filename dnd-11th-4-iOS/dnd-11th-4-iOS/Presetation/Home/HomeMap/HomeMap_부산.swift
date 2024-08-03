//
//  HomeMap_부산.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_부산: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 324.95, y: 485))
        shape.addLine(to: CGPoint(x: 318.25, y: 509.26))
        shape.addCurve(to: CGPoint(x: 314.7, y: 512.34), controlPoint1: CGPoint(x: 317.8, y: 510.9), controlPoint2: CGPoint(x: 316.39, y: 512.12))
        shape.addLine(to: CGPoint(x: 301, y: 514.15))
        shape.addCurve(to: CGPoint(x: 298.9, y: 515.03), controlPoint1: CGPoint(x: 300.23, y: 514.25), controlPoint2: CGPoint(x: 299.51, y: 514.56))
        shape.addLine(to: CGPoint(x: 288.11, y: 523.59))
        shape.addCurve(to: CGPoint(x: 284.19, y: 524.32), controlPoint1: CGPoint(x: 287.01, y: 524.47), controlPoint2: CGPoint(x: 285.54, y: 524.74))
        shape.addLine(to: CGPoint(x: 285.4, y: 506.96))
        shape.addCurve(to: CGPoint(x: 288.38, y: 501.03), controlPoint1: CGPoint(x: 285.56, y: 504.67), controlPoint2: CGPoint(x: 286.63, y: 502.53))
        shape.addLine(to: CGPoint(x: 314.85, y: 478.23))
        shape.addLine(to: CGPoint(x: 324.95, y: 485))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.mapBackground.cgColor
        shapeLayer.fillColor = UIColor.mapGray.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    
}

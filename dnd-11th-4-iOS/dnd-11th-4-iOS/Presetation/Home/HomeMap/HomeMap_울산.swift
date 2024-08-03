//
//  HomeMap_울산.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_울산: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 335.68, y: 446.18))
        shape.addLine(to: CGPoint(x: 324.95, y: 485))
        shape.addLine(to: CGPoint(x: 314.85, y: 478.23))
        shape.addLine(to: CGPoint(x: 301.63, y: 469.4))
        shape.addCurve(to: CGPoint(x: 299.5, y: 467.09), controlPoint1: CGPoint(x: 300.75, y: 468.81), controlPoint2: CGPoint(x: 300.02, y: 468.02))
        shape.addLine(to: CGPoint(x: 296.13, y: 461.09))
        shape.addCurve(to: CGPoint(x: 293.48, y: 458.48), controlPoint1: CGPoint(x: 295.49, y: 459.97), controlPoint2: CGPoint(x: 294.57, y: 459.07))
        shape.addLine(to: CGPoint(x: 308.04, y: 448.71))
        shape.addCurve(to: CGPoint(x: 316.97, y: 446.18), controlPoint1: CGPoint(x: 310.73, y: 447.06), controlPoint2: CGPoint(x: 313.82, y: 446.18))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.mapBackground.cgColor
        shapeLayer.fillColor = UIColor.mapGray.cgColor
        shapeLayer.lineWidth = 1.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    
}

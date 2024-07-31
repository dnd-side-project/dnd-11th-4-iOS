//
//  HomeMap_세종시.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class HomeMap_세종시: UIView, DrawMapProtocol {
    
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
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    
}

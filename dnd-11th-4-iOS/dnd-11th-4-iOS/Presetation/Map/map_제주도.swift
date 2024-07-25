//
//  map_제주도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/23/24.
//

import UIKit

final class map_제주도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 103.95, y: 650.71))
        shape.addLine(to: CGPoint(x: 93.51, y: 660.4))
        shape.addCurve(to: CGPoint(x: 90.28, y: 662.16), controlPoint1: CGPoint(x: 92.6, y: 661.24), controlPoint2: CGPoint(x: 91.5, y: 661.85))
        shape.addLine(to: CGPoint(x: 46.12, y: 673.44))
        shape.addCurve(to: CGPoint(x: 38.56, y: 670.99), controlPoint1: CGPoint(x: 43.33, y: 674.14), controlPoint2: CGPoint(x: 40.39, y: 673.19))
        shape.addLine(to: CGPoint(x: 33.43, y: 664.84))
        shape.addCurve(to: CGPoint(x: 33.55, y: 655.16), controlPoint1: CGPoint(x: 31.09, y: 662.02), controlPoint2: CGPoint(x: 31.14, y: 657.92))
        shape.addLine(to: CGPoint(x: 45.03, y: 642.07))
        shape.addCurve(to: CGPoint(x: 49.42, y: 639.64), controlPoint1: CGPoint(x: 46.17, y: 640.78), controlPoint2: CGPoint(x: 47.72, y: 639.92))
        shape.addLine(to: CGPoint(x: 88.61, y: 633.15))
        shape.addCurve(to: CGPoint(x: 93.29, y: 633.91), controlPoint1: CGPoint(x: 90.21, y: 632.89), controlPoint2: CGPoint(x: 91.85, y: 633.15))
        shape.addLine(to: CGPoint(x: 102.35, y: 638.67))
        shape.addCurve(to: CGPoint(x: 103.95, y: 650.71), controlPoint1: CGPoint(x: 106.89, y: 641.06), controlPoint2: CGPoint(x: 107.71, y: 647.22))
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

//
//  OnboardingMap_충청북도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_충청북도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 239.04, y: 305.54))
        shape.addLine(to: CGPoint(x: 224.55, y: 321.53))
        shape.addCurve(to: CGPoint(x: 223.5, y: 322.33), controlPoint1: CGPoint(x: 224.25, y: 321.86), controlPoint2: CGPoint(x: 223.89, y: 322.13))
        shape.addLine(to: CGPoint(x: 198.24, y: 334.8))
        shape.addCurve(to: CGPoint(x: 196.59, y: 339.5), controlPoint1: CGPoint(x: 196.5, y: 335.66), controlPoint2: CGPoint(x: 195.77, y: 337.74))
        shape.addLine(to: CGPoint(x: 197.52, y: 341.51))
        shape.addCurve(to: CGPoint(x: 197.65, y: 344.23), controlPoint1: CGPoint(x: 197.93, y: 342.37), controlPoint2: CGPoint(x: 197.96, y: 343.34))
        shape.addLine(to: CGPoint(x: 192.89, y: 357.43))
        shape.addCurve(to: CGPoint(x: 194.86, y: 361.92), controlPoint1: CGPoint(x: 192.24, y: 359.22), controlPoint2: CGPoint(x: 193.11, y: 361.2))
        shape.addLine(to: CGPoint(x: 198.64, y: 363.5))
        shape.addCurve(to: CGPoint(x: 200.72, y: 367.64), controlPoint1: CGPoint(x: 200.26, y: 364.17), controlPoint2: CGPoint(x: 201.14, y: 365.94))
        shape.addLine(to: CGPoint(x: 198.28, y: 377.43))
        shape.addCurve(to: CGPoint(x: 195.4, y: 380.08), controlPoint1: CGPoint(x: 197.94, y: 378.81), controlPoint2: CGPoint(x: 196.8, y: 379.86))
        shape.addLine(to: CGPoint(x: 189.92, y: 380.95))
        shape.addLine(to: CGPoint(x: 181.19, y: 382.34))
        shape.addCurve(to: CGPoint(x: 179.2, y: 382.08), controlPoint1: CGPoint(x: 180.5, y: 382.45), controlPoint2: CGPoint(x: 179.81, y: 382.35))
        shape.addCurve(to: CGPoint(x: 177.49, y: 380.49), controlPoint1: CGPoint(x: 178.49, y: 381.77), controlPoint2: CGPoint(x: 177.88, y: 381.21))
        shape.addLine(to: CGPoint(x: 170.84, y: 367.83))
        shape.addCurve(to: CGPoint(x: 170.45, y: 366.47), controlPoint1: CGPoint(x: 170.61, y: 367.41), controlPoint2: CGPoint(x: 170.49, y: 366.94))
        shape.addCurve(to: CGPoint(x: 170.51, y: 365.44), controlPoint1: CGPoint(x: 170.42, y: 366.13), controlPoint2: CGPoint(x: 170.43, y: 365.78))
        shape.addLine(to: CGPoint(x: 173.08, y: 353.15))
        shape.addCurve(to: CGPoint(x: 172.04, y: 349.83), controlPoint1: CGPoint(x: 173.34, y: 351.93), controlPoint2: CGPoint(x: 172.94, y: 350.67))
        shape.addLine(to: CGPoint(x: 170.24, y: 348.14))
        shape.addLine(to: CGPoint(x: 161.96, y: 340.34))
        shape.addCurve(to: CGPoint(x: 161.09, y: 339.05), controlPoint1: CGPoint(x: 161.57, y: 339.97), controlPoint2: CGPoint(x: 161.27, y: 339.53))
        shape.addCurve(to: CGPoint(x: 161.22, y: 336.13), controlPoint1: CGPoint(x: 160.72, y: 338.12), controlPoint2: CGPoint(x: 160.75, y: 337.06))
        shape.addLine(to: CGPoint(x: 162.59, y: 333.43))
        shape.addCurve(to: CGPoint(x: 161.49, y: 328.92), controlPoint1: CGPoint(x: 163.39, y: 331.86), controlPoint2: CGPoint(x: 162.92, y: 329.95))
        shape.addLine(to: CGPoint(x: 155.47, y: 322.36))
        shape.addCurve(to: CGPoint(x: 158.38, y: 321.42), controlPoint1: CGPoint(x: 156.48, y: 322.39), controlPoint2: CGPoint(x: 157.51, y: 322.08))
        shape.addLine(to: CGPoint(x: 181.03, y: 304.13))
        shape.addLine(to: CGPoint(x: 193.54, y: 304.18))
        shape.addCurve(to: CGPoint(x: 198.08, y: 303), controlPoint1: CGPoint(x: 195.14, y: 304.22), controlPoint2: CGPoint(x: 196.71, y: 303.82))
        shape.addLine(to: CGPoint(x: 210.95, y: 295.38))
        shape.addCurve(to: CGPoint(x: 219.2, y: 295.16), controlPoint1: CGPoint(x: 213.48, y: 293.88), controlPoint2: CGPoint(x: 216.6, y: 293.8))
        shape.addLine(to: CGPoint(x: 239.04, y: 305.54))
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

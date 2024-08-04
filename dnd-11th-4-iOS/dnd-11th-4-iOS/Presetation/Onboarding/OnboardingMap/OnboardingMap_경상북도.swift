//
//  OnboardingMap_경상북도.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class OnboardingMap_경상북도: UIView, DrawMapProtocol {
    
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
        shape.move(to: CGPoint(x: 285.69, y: 383.26))
        shape.addLine(to: CGPoint(x: 280.22, y: 403.13))
        shape.addCurve(to: CGPoint(x: 263.08, y: 404.7), controlPoint1: CGPoint(x: 266.66, y: 403.13), controlPoint2: CGPoint(x: 264.74, y: 403.67))
        shape.addLine(to: CGPoint(x: 254.04, y: 410.77))
        shape.addCurve(to: CGPoint(x: 251.72, y: 410.27), controlPoint1: CGPoint(x: 253.35, y: 410.39), controlPoint2: CGPoint(x: 252.54, y: 410.2))
        shape.addLine(to: CGPoint(x: 227.92, y: 412.04))
        shape.addLine(to: CGPoint(x: 230.81, y: 405.26))
        shape.addCurve(to: CGPoint(x: 233.33, y: 403.33), controlPoint1: CGPoint(x: 231.24, y: 404.21), controlPoint2: CGPoint(x: 232.21, y: 403.47))
        shape.addLine(to: CGPoint(x: 238.66, y: 402.66))
        shape.addCurve(to: CGPoint(x: 241.4, y: 399.08), controlPoint1: CGPoint(x: 240.41, y: 402.44), controlPoint2: CGPoint(x: 241.64, y: 400.83))
        shape.addLine(to: CGPoint(x: 239.81, y: 387.42))
        shape.addCurve(to: CGPoint(x: 234.66, y: 385.41), controlPoint1: CGPoint(x: 239.47, y: 384.96), controlPoint2: CGPoint(x: 236.57, y: 383.83))
        shape.addLine(to: CGPoint(x: 222.33, y: 395.67))
        shape.addCurve(to: CGPoint(x: 221.19, y: 398.11), controlPoint1: CGPoint(x: 221.61, y: 396.28), controlPoint2: CGPoint(x: 221.19, y: 397.16))
        shape.addLine(to: CGPoint(x: 221.34, y: 412.54))
        shape.addLine(to: CGPoint(x: 217.22, y: 412.84))
        shape.addCurve(to: CGPoint(x: 212.84, y: 409.69), controlPoint1: CGPoint(x: 215.19, y: 412.99), controlPoint2: CGPoint(x: 213.35, y: 411.66))
        shape.addLine(to: CGPoint(x: 210.75, y: 401.58))
        shape.addCurve(to: CGPoint(x: 208.46, y: 398.82), controlPoint1: CGPoint(x: 210.44, y: 400.36), controlPoint2: CGPoint(x: 209.6, y: 399.35))
        shape.addLine(to: CGPoint(x: 194.34, y: 392.2))
        shape.addCurve(to: CGPoint(x: 191.89, y: 391.87), controlPoint1: CGPoint(x: 193.57, y: 391.84), controlPoint2: CGPoint(x: 192.71, y: 391.73))
        shape.addLine(to: CGPoint(x: 189.92, y: 380.95))
        shape.addLine(to: CGPoint(x: 195.4, y: 380.08))
        shape.addCurve(to: CGPoint(x: 198.28, y: 377.43), controlPoint1: CGPoint(x: 196.8, y: 379.86), controlPoint2: CGPoint(x: 197.94, y: 378.81))
        shape.addLine(to: CGPoint(x: 200.72, y: 367.64))
        shape.addCurve(to: CGPoint(x: 198.64, y: 363.5), controlPoint1: CGPoint(x: 201.14, y: 365.94), controlPoint2: CGPoint(x: 200.26, y: 364.17))
        shape.addLine(to: CGPoint(x: 194.86, y: 361.93))
        shape.addCurve(to: CGPoint(x: 192.89, y: 357.44), controlPoint1: CGPoint(x: 193.11, y: 361.2), controlPoint2: CGPoint(x: 192.24, y: 359.22))
        shape.addLine(to: CGPoint(x: 197.65, y: 344.23))
        shape.addCurve(to: CGPoint(x: 197.52, y: 341.51), controlPoint1: CGPoint(x: 197.96, y: 343.34), controlPoint2: CGPoint(x: 197.93, y: 342.37))
        shape.addLine(to: CGPoint(x: 196.59, y: 339.5))
        shape.addCurve(to: CGPoint(x: 198.24, y: 334.8), controlPoint1: CGPoint(x: 195.77, y: 337.74), controlPoint2: CGPoint(x: 196.5, y: 335.66))
        shape.addLine(to: CGPoint(x: 223.5, y: 322.33))
        shape.addCurve(to: CGPoint(x: 224.55, y: 321.53), controlPoint1: CGPoint(x: 223.89, y: 322.13), controlPoint2: CGPoint(x: 224.25, y: 321.86))
        shape.addLine(to: CGPoint(x: 239.04, y: 305.54))
        shape.addLine(to: CGPoint(x: 242.76, y: 307.49))
        shape.addCurve(to: CGPoint(x: 247.23, y: 308.44), controlPoint1: CGPoint(x: 244.14, y: 308.21), controlPoint2: CGPoint(x: 245.68, y: 308.53))
        shape.addLine(to: CGPoint(x: 280.17, y: 306.34))
        shape.addLine(to: CGPoint(x: 278.55, y: 377.58))
        shape.addCurve(to: CGPoint(x: 281.18, y: 380.29), controlPoint1: CGPoint(x: 278.51, y: 379.13), controlPoint2: CGPoint(x: 279.77, y: 380.29))
        shape.addCurve(to: CGPoint(x: 282.17, y: 380.1), controlPoint1: CGPoint(x: 281.5, y: 380.29), controlPoint2: CGPoint(x: 281.84, y: 380.23))
        shape.addCurve(to: CGPoint(x: 285.69, y: 383.26), controlPoint1: CGPoint(x: 284.19, y: 379.28), controlPoint2: CGPoint(x: 286.27, y: 381.15))
        shape.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        self.layer.addSublayer(shapeLayer)
    }
}

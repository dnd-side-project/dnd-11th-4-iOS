//
//  ViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/18/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawMap()
    }
    
    func drawMap() {
        let mapView = UIView(frame: self.view.bounds)
        mapView.backgroundColor = .clear
        view.addSubview(mapView)
        
        mapView.layer.addSublayer(map189())
        mapView.layer.addSublayer(map105())
        mapView.layer.addSublayer(map182())
        mapView.layer.addSublayer(map345())
        mapView.layer.addSublayer(map173())
        mapView.layer.addSublayer(map168())
        mapView.layer.addSublayer(map203())
        mapView.layer.addSublayer(map354())
        mapView.layer.addSublayer(map324())
        mapView.layer.addSublayer(map184())
        mapView.layer.addSublayer(map334())
        mapView.layer.addSublayer(map3450())
        mapView.layer.addSublayer(map78())
        mapView.layer.addSublayer(map113())
        mapView.layer.addSublayer(map166())
        mapView.layer.addSublayer(map61())
        mapView.layer.addSublayer(map279())
        mapView.layer.addSublayer(map278())
        mapView.layer.addSublayer(map123())
        mapView.layer.addSublayer(map144())
        
    }
    
    func map189() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 189.26, y: 253.88))
        shape.addCurve(to: CGPoint(x: 176.66, y: 248.61), controlPoint1: CGPoint(x: 180.47, y: 253.88), controlPoint2: CGPoint(x: 177.59, y: 251.74))
        shape.addLine(to: CGPoint(x: 172.03, y: 233.25))
        shape.addCurve(to: CGPoint(x: 172.28, y: 228.29), controlPoint1: CGPoint(x: 171.54, y: 231.62), controlPoint2: CGPoint(x: 171.62, y: 229.86))
        shape.addLine(to: CGPoint(x: 179.5, y: 210.81))
        shape.addCurve(to: CGPoint(x: 176.97, y: 201.97), controlPoint1: CGPoint(x: 180.8, y: 207.63), controlPoint2: CGPoint(x: 179.76, y: 203.97))
        shape.addLine(to: CGPoint(x: 132.3, y: 169.87))
        shape.addLine(to: CGPoint(x: 95.08, y: 217.05))
        shape.addCurve(to: CGPoint(x: 91.33, y: 218.65), controlPoint1: CGPoint(x: 94.18, y: 218.19), controlPoint2: CGPoint(x: 92.77, y: 218.79))
        shape.addLine(to: CGPoint(x: 74.05, y: 217.02))
        shape.addCurve(to: CGPoint(x: 69.41, y: 221.6), controlPoint1: CGPoint(x: 71.41, y: 216.77), controlPoint2: CGPoint(x: 69.19, y: 218.96))
        shape.addLine(to: CGPoint(x: 70.54, y: 235.42))
        shape.addCurve(to: CGPoint(x: 74.78, y: 239.33), controlPoint1: CGPoint(x: 70.72, y: 237.63), controlPoint2: CGPoint(x: 72.56, y: 239.33))
        shape.addCurve(to: CGPoint(x: 85.85, y: 241.11), controlPoint1: CGPoint(x: 83.8, y: 239.33), controlPoint2: CGPoint(x: 85.07, y: 240.02))
        shape.addLine(to: CGPoint(x: 94.07, y: 235.65))
        shape.addCurve(to: CGPoint(x: 99.16, y: 235.55), controlPoint1: CGPoint(x: 95.6, y: 234.63), controlPoint2: CGPoint(x: 97.59, y: 234.6))
        shape.addLine(to: CGPoint(x: 103.69, y: 238.31))
        shape.addCurve(to: CGPoint(x: 105.92, y: 242.96), controlPoint1: CGPoint(x: 105.28, y: 239.29), controlPoint2: CGPoint(x: 106.16, y: 241.1))
        shape.addLine(to: CGPoint(x: 103.46, y: 262.35))
        shape.addCurve(to: CGPoint(x: 101.16, y: 265.85), controlPoint1: CGPoint(x: 103.28, y: 263.82), controlPoint2: CGPoint(x: 102.42, y: 265.1))
        shape.addLine(to: CGPoint(x: 93.32, y: 270.44))
        shape.addLine(to: CGPoint(x: 97.38, y: 272.34))
        shape.addCurve(to: CGPoint(x: 97.89, y: 279.76), controlPoint1: CGPoint(x: 100.41, y: 273.76), controlPoint2: CGPoint(x: 100.69, y: 277.95))
        shape.addLine(to: CGPoint(x: 92.46, y: 283.27))
        shape.addCurve(to: CGPoint(x: 91.44, y: 289.49), controlPoint1: CGPoint(x: 90.35, y: 284.64), controlPoint2: CGPoint(x: 89.88, y: 287.53))
        shape.addLine(to: CGPoint(x: 96.02, y: 295.27))
        shape.addCurve(to: CGPoint(x: 96.57, y: 299.66), controlPoint1: CGPoint(x: 97.1, y: 296.62), controlPoint2: CGPoint(x: 97.18, y: 298.3))
        shape.addLine(to: CGPoint(x: 129.64, y: 307.98))
        shape.addCurve(to: CGPoint(x: 133.71, y: 310.65), controlPoint1: CGPoint(x: 131.26, y: 308.39), controlPoint2: CGPoint(x: 132.7, y: 309.33))
        shape.addLine(to: CGPoint(x: 138.89, y: 317.4))
        shape.addCurve(to: CGPoint(x: 144.55, y: 320.3), controlPoint1: CGPoint(x: 140.3, y: 319.23), controlPoint2: CGPoint(x: 142.4, y: 320.23))
        shape.addCurve(to: CGPoint(x: 149.24, y: 318.79), controlPoint1: CGPoint(x: 146.18, y: 320.34), controlPoint2: CGPoint(x: 147.84, y: 319.85))
        shape.addLine(to: CGPoint(x: 185.76, y: 290.99))
        shape.addLine(to: CGPoint(x: 188.06, y: 289.24))
        shape.addCurve(to: CGPoint(x: 190.74, y: 285.2), controlPoint1: CGPoint(x: 189.38, y: 288.23), controlPoint2: CGPoint(x: 190.32, y: 286.81))
        shape.addLine(to: CGPoint(x: 196.42, y: 263.12))
        shape.addCurve(to: CGPoint(x: 189.26, y: 253.88), controlPoint1: CGPoint(x: 197.62, y: 258.44), controlPoint2: CGPoint(x: 194.09, y: 253.88))
        shape.close()
        shape.move(to: CGPoint(x: 144.87, y: 250.61))
        shape.addLine(to: CGPoint(x: 137.2, y: 257.67))
        shape.addCurve(to: CGPoint(x: 133.27, y: 258.08), controlPoint1: CGPoint(x: 136.13, y: 258.66), controlPoint2: CGPoint(x: 134.53, y: 258.83))
        shape.addLine(to: CGPoint(x: 127.82, y: 254.85))
        shape.addCurve(to: CGPoint(x: 124.52, y: 254.8), controlPoint1: CGPoint(x: 126.81, y: 254.25), controlPoint2: CGPoint(x: 125.55, y: 254.23))
        shape.addLine(to: CGPoint(x: 120.09, y: 257.25))
        shape.addCurve(to: CGPoint(x: 115.27, y: 255.17), controlPoint1: CGPoint(x: 118.18, y: 258.31), controlPoint2: CGPoint(x: 115.8, y: 257.28))
        shape.addLine(to: CGPoint(x: 112.61, y: 244.74))
        shape.addCurve(to: CGPoint(x: 114.88, y: 240.74), controlPoint1: CGPoint(x: 112.18, y: 243.01), controlPoint2: CGPoint(x: 113.18, y: 241.25))
        shape.addCurve(to: CGPoint(x: 116.33, y: 239.85), controlPoint1: CGPoint(x: 115.44, y: 240.58), controlPoint2: CGPoint(x: 115.94, y: 240.27))
        shape.addLine(to: CGPoint(x: 124.74, y: 231.06))
        shape.addCurve(to: CGPoint(x: 127.13, y: 230.03), controlPoint1: CGPoint(x: 125.37, y: 230.4), controlPoint2: CGPoint(x: 126.23, y: 230.03))
        shape.addCurve(to: CGPoint(x: 139.44, y: 233.35), controlPoint1: CGPoint(x: 137.95, y: 230.03), controlPoint2: CGPoint(x: 139.44, y: 231.51))
        shape.addLine(to: CGPoint(x: 144.61, y: 245.51))
        shape.addCurve(to: CGPoint(x: 144.87, y: 250.61), controlPoint1: CGPoint(x: 146.27, y: 246.75), controlPoint2: CGPoint(x: 146.4, y: 249.2))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map105() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 105.92, y: 242.96))
        shape.addLine(to: CGPoint(x: 103.46, y: 262.35))
        shape.addCurve(to: CGPoint(x: 101.16, y: 265.85), controlPoint1: CGPoint(x: 103.28, y: 263.82), controlPoint2: CGPoint(x: 102.42, y: 265.1))
        shape.addLine(to: CGPoint(x: 93.32, y: 270.44))
        shape.addLine(to: CGPoint(x: 91.62, y: 269.63))
        shape.addCurve(to: CGPoint(x: 89.19, y: 266.25), controlPoint1: CGPoint(x: 90.27, y: 269.01), controlPoint2: CGPoint(x: 89.36, y: 267.72))
        shape.addLine(to: CGPoint(x: 86.62, y: 243.11))
        shape.addCurve(to: CGPoint(x: 85.85, y: 241.11), controlPoint1: CGPoint(x: 86.54, y: 242.36), controlPoint2: CGPoint(x: 86.26, y: 241.68))
        shape.addLine(to: CGPoint(x: 94.07, y: 235.65))
        shape.addCurve(to: CGPoint(x: 99.16, y: 235.55), controlPoint1: CGPoint(x: 95.6, y: 234.63), controlPoint2: CGPoint(x: 97.59, y: 234.6))
        shape.addLine(to: CGPoint(x: 103.69, y: 238.31))
        shape.addCurve(to: CGPoint(x: 105.92, y: 242.96), controlPoint1: CGPoint(x: 105.28, y: 239.29), controlPoint2: CGPoint(x: 106.16, y: 241.1))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map182() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 182.81, y: 416.34))
        shape.addCurve(to: CGPoint(x: 166.53, y: 419.2), controlPoint1: CGPoint(x: 178.78, y: 420.58), controlPoint2: CGPoint(x: 171.44, y: 422.4))
        shape.addLine(to: CGPoint(x: 156.14, y: 412.4))
        shape.addCurve(to: CGPoint(x: 138.34, y: 409.99), controlPoint1: CGPoint(x: 150.88, y: 408.95), controlPoint2: CGPoint(x: 144.33, y: 408.06))
        shape.addLine(to: CGPoint(x: 92.6, y: 424.74))
        shape.addLine(to: CGPoint(x: 73.09, y: 351.29))
        shape.addCurve(to: CGPoint(x: 68.98, y: 348.12), controlPoint1: CGPoint(x: 72.6, y: 349.43), controlPoint2: CGPoint(x: 70.91, y: 348.12))
        shape.addCurve(to: CGPoint(x: 57.5, y: 346.72), controlPoint1: CGPoint(x: 59.46, y: 348.12), controlPoint2: CGPoint(x: 58.31, y: 347.61))
        shape.addLine(to: CGPoint(x: 44.54, y: 332.35))
        shape.addCurve(to: CGPoint(x: 44.96, y: 326.23), controlPoint1: CGPoint(x: 42.92, y: 330.56), controlPoint2: CGPoint(x: 43.12, y: 327.78))
        shape.addLine(to: CGPoint(x: 71.19, y: 304.38))
        shape.addCurve(to: CGPoint(x: 73.63, y: 303.41), controlPoint1: CGPoint(x: 71.88, y: 303.81), controlPoint2: CGPoint(x: 72.73, y: 303.46))
        shape.addLine(to: CGPoint(x: 92.96, y: 302.16))
        shape.addCurve(to: CGPoint(x: 96.57, y: 299.66), controlPoint1: CGPoint(x: 94.67, y: 302.04), controlPoint2: CGPoint(x: 95.96, y: 301.01))
        shape.addLine(to: CGPoint(x: 129.64, y: 307.98))
        shape.addCurve(to: CGPoint(x: 133.71, y: 310.65), controlPoint1: CGPoint(x: 131.26, y: 308.39), controlPoint2: CGPoint(x: 132.7, y: 309.33))
        shape.addLine(to: CGPoint(x: 138.89, y: 317.4))
        shape.addCurve(to: CGPoint(x: 144.55, y: 320.3), controlPoint1: CGPoint(x: 140.3, y: 319.23), controlPoint2: CGPoint(x: 142.4, y: 320.23))
        shape.addLine(to: CGPoint(x: 154.26, y: 330.85))
        shape.addCurve(to: CGPoint(x: 156.03, y: 338.1), controlPoint1: CGPoint(x: 156.56, y: 332.5), controlPoint2: CGPoint(x: 157.32, y: 335.58))
        shape.addLine(to: CGPoint(x: 153.83, y: 342.44))
        shape.addCurve(to: CGPoint(x: 153.61, y: 347.14), controlPoint1: CGPoint(x: 153.07, y: 343.93), controlPoint2: CGPoint(x: 153.02, y: 345.65))
        shape.addLine(to: CGPoint(x: 148.1, y: 344.36))
        shape.addCurve(to: CGPoint(x: 141.32, y: 349.52), controlPoint1: CGPoint(x: 144.58, y: 342.59), controlPoint2: CGPoint(x: 140.56, y: 345.65))
        shape.addLine(to: CGPoint(x: 144.53, y: 365.66))
        shape.addCurve(to: CGPoint(x: 147.82, y: 369.28), controlPoint1: CGPoint(x: 144.88, y: 367.47), controlPoint2: CGPoint(x: 146.21, y: 368.8))
        shape.addCurve(to: CGPoint(x: 151.69, y: 391.86), controlPoint1: CGPoint(x: 147.82, y: 387.8), controlPoint2: CGPoint(x: 149.29, y: 390.4))
        shape.addLine(to: CGPoint(x: 156.22, y: 394.6))
        shape.addCurve(to: CGPoint(x: 165.45, y: 393.97), controlPoint1: CGPoint(x: 159.12, y: 396.35), controlPoint2: CGPoint(x: 162.81, y: 396.11))
        shape.addLine(to: CGPoint(x: 168.7, y: 391.23))
        shape.addCurve(to: CGPoint(x: 169.34, y: 393.42), controlPoint1: CGPoint(x: 168.76, y: 391.99), controlPoint2: CGPoint(x: 168.97, y: 392.74))
        shape.addLine(to: CGPoint(x: 180.06, y: 413.78))
        shape.addCurve(to: CGPoint(x: 182.81, y: 416.34), controlPoint1: CGPoint(x: 180.68, y: 414.95), controlPoint2: CGPoint(x: 181.66, y: 415.84))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map345() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 345.6, y: 294.54))
        shape.addLine(to: CGPoint(x: 292.49, y: 297.91))
        shape.addCurve(to: CGPoint(x: 285.29, y: 296.38), controlPoint1: CGPoint(x: 289.99, y: 298.06), controlPoint2: CGPoint(x: 287.51, y: 297.53))
        shape.addLine(to: CGPoint(x: 279.29, y: 293.24))
        shape.addLine(to: CGPoint(x: 247.3, y: 276.55))
        shape.addCurve(to: CGPoint(x: 234.01, y: 276.91), controlPoint1: CGPoint(x: 243.1, y: 274.37), controlPoint2: CGPoint(x: 238.08, y: 274.5))
        shape.addLine(to: CGPoint(x: 213.26, y: 289.17))
        shape.addCurve(to: CGPoint(x: 205.94, y: 291.07), controlPoint1: CGPoint(x: 211.04, y: 290.48), controlPoint2: CGPoint(x: 208.5, y: 291.13))
        shape.addLine(to: CGPoint(x: 185.76, y: 290.99))
        shape.addLine(to: CGPoint(x: 188.06, y: 289.24))
        shape.addCurve(to: CGPoint(x: 190.74, y: 285.2), controlPoint1: CGPoint(x: 189.38, y: 288.23), controlPoint2: CGPoint(x: 190.32, y: 286.81))
        shape.addLine(to: CGPoint(x: 196.42, y: 263.12))
        shape.addCurve(to: CGPoint(x: 189.26, y: 253.88), controlPoint1: CGPoint(x: 197.62, y: 258.44), controlPoint2: CGPoint(x: 194.09, y: 253.88))
        shape.addCurve(to: CGPoint(x: 176.66, y: 248.61), controlPoint1: CGPoint(x: 180.47, y: 253.88), controlPoint2: CGPoint(x: 177.59, y: 251.74))
        shape.addLine(to: CGPoint(x: 172.03, y: 233.25))
        shape.addCurve(to: CGPoint(x: 172.28, y: 228.29), controlPoint1: CGPoint(x: 171.54, y: 231.62), controlPoint2: CGPoint(x: 171.62, y: 229.86))
        shape.addLine(to: CGPoint(x: 179.5, y: 210.81))
        shape.addCurve(to: CGPoint(x: 176.97, y: 201.97), controlPoint1: CGPoint(x: 180.8, y: 207.63), controlPoint2: CGPoint(x: 179.76, y: 203.97))
        shape.addLine(to: CGPoint(x: 132.3, y: 169.87))
        shape.addLine(to: CGPoint(x: 139.44, y: 160.82))
        shape.addCurve(to: CGPoint(x: 142.45, y: 159.21), controlPoint1: CGPoint(x: 140.18, y: 159.89), controlPoint2: CGPoint(x: 141.26, y: 159.31))
        shape.addLine(to: CGPoint(x: 225.32, y: 152.59))
        shape.addCurve(to: CGPoint(x: 228.96, y: 149.87), controlPoint1: CGPoint(x: 226.96, y: 152.47), controlPoint2: CGPoint(x: 228.37, y: 151.4))
        shape.addLine(to: CGPoint(x: 236.12, y: 131.09))
        shape.addCurve(to: CGPoint(x: 243.69, y: 130.34), controlPoint1: CGPoint(x: 237.37, y: 127.8), controlPoint2: CGPoint(x: 241.84, y: 127.36))
        shape.addLine(to: CGPoint(x: 344.95, y: 292.18))
        shape.addCurve(to: CGPoint(x: 345.6, y: 294.54), controlPoint1: CGPoint(x: 345.39, y: 292.89), controlPoint2: CGPoint(x: 345.62, y: 293.71))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map173() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 173.13, y: 370.06))
        shape.addLine(to: CGPoint(x: 168.98, y: 389.83))
        shape.addCurve(to: CGPoint(x: 168.88, y: 391.47), controlPoint1: CGPoint(x: 168.86, y: 390.37), controlPoint2: CGPoint(x: 168.83, y: 390.93))
        shape.addLine(to: CGPoint(x: 165.63, y: 394.22))
        shape.addCurve(to: CGPoint(x: 156.4, y: 394.84), controlPoint1: CGPoint(x: 162.99, y: 396.36), controlPoint2: CGPoint(x: 159.3, y: 396.6))
        shape.addLine(to: CGPoint(x: 151.87, y: 392.1))
        shape.addCurve(to: CGPoint(x: 148, y: 385.23), controlPoint1: CGPoint(x: 149.47, y: 390.65), controlPoint2: CGPoint(x: 148, y: 388.04))
        shape.addCurve(to: CGPoint(x: 151.21, y: 369.35), controlPoint1: CGPoint(x: 149.01, y: 369.83), controlPoint2: CGPoint(x: 150.14, y: 369.8))
        shape.addLine(to: CGPoint(x: 168.55, y: 362))
        shape.addLine(to: CGPoint(x: 171.45, y: 364.71))
        shape.addCurve(to: CGPoint(x: 173.13, y: 370.06), controlPoint1: CGPoint(x: 172.9, y: 366.08), controlPoint2: CGPoint(x: 173.54, y: 368.1))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map168() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 168.37, y: 361.75))
        shape.addLine(to: CGPoint(x: 151.03, y: 369.1))
        shape.addCurve(to: CGPoint(x: 147.82, y: 369.28), controlPoint1: CGPoint(x: 149.96, y: 369.56), controlPoint2: CGPoint(x: 148.83, y: 369.58))
        shape.addCurve(to: CGPoint(x: 144.53, y: 365.66), controlPoint1: CGPoint(x: 146.21, y: 368.8), controlPoint2: CGPoint(x: 144.88, y: 367.47))
        shape.addLine(to: CGPoint(x: 141.32, y: 349.52))
        shape.addCurve(to: CGPoint(x: 148.1, y: 344.36), controlPoint1: CGPoint(x: 140.56, y: 345.65), controlPoint2: CGPoint(x: 144.58, y: 342.59))
        shape.addLine(to: CGPoint(x: 153.61, y: 347.14))
        shape.addCurve(to: CGPoint(x: 155.01, y: 349.21), controlPoint1: CGPoint(x: 153.91, y: 347.9), controlPoint2: CGPoint(x: 154.39, y: 348.61))
        shape.addLine(to: CGPoint(x: 168.37, y: 361.75))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map203() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 203.28, y: 432.07))
        shape.addCurve(to: CGPoint(x: 199.67, y: 433.88), controlPoint1: CGPoint(x: 201.95, y: 432.29), controlPoint2: CGPoint(x: 200.69, y: 432.9))
        shape.addLine(to: CGPoint(x: 184.05, y: 448.88))
        shape.addCurve(to: CGPoint(x: 181.97, y: 453.76), controlPoint1: CGPoint(x: 182.73, y: 450.16), controlPoint2: CGPoint(x: 181.97, y: 451.92))
        shape.addCurve(to: CGPoint(x: 179.08, y: 500.01), controlPoint1: CGPoint(x: 181.97, y: 496.78), controlPoint2: CGPoint(x: 180.83, y: 498.8))
        shape.addCurve(to: CGPoint(x: 174.67, y: 501.22), controlPoint1: CGPoint(x: 177.85, y: 500.88), controlPoint2: CGPoint(x: 176.31, y: 501.35))
        shape.addLine(to: CGPoint(x: 135.21, y: 498.11))
        shape.addCurve(to: CGPoint(x: 128.97, y: 491.36), controlPoint1: CGPoint(x: 131.69, y: 497.82), controlPoint2: CGPoint(x: 128.97, y: 494.88))
        shape.addCurve(to: CGPoint(x: 125.69, y: 479.25), controlPoint1: CGPoint(x: 128.97, y: 482.67), controlPoint2: CGPoint(x: 127.73, y: 480.47))
        shape.addLine(to: CGPoint(x: 112.56, y: 471.37))
        shape.addCurve(to: CGPoint(x: 103.03, y: 474.12), controlPoint1: CGPoint(x: 109.18, y: 469.34), controlPoint2: CGPoint(x: 104.8, y: 470.62))
        shape.addLine(to: CGPoint(x: 95.91, y: 488.25))
        shape.addCurve(to: CGPoint(x: 86.33, y: 490.97), controlPoint1: CGPoint(x: 94.13, y: 491.79), controlPoint2: CGPoint(x: 89.7, y: 493.04))
        shape.addLine(to: CGPoint(x: 72.04, y: 482.2))
        shape.addLine(to: CGPoint(x: 95.18, y: 438.88))
        shape.addCurve(to: CGPoint(x: 95.53, y: 435.78), controlPoint1: CGPoint(x: 95.68, y: 437.93), controlPoint2: CGPoint(x: 95.8, y: 436.82))
        shape.addLine(to: CGPoint(x: 92.6, y: 424.74))
        shape.addLine(to: CGPoint(x: 138.34, y: 409.99))
        shape.addCurve(to: CGPoint(x: 156.14, y: 412.4), controlPoint1: CGPoint(x: 144.33, y: 408.06), controlPoint2: CGPoint(x: 150.88, y: 408.95))
        shape.addLine(to: CGPoint(x: 166.53, y: 419.2))
        shape.addCurve(to: CGPoint(x: 182.81, y: 416.34), controlPoint1: CGPoint(x: 171.44, y: 422.4), controlPoint2: CGPoint(x: 178.78, y: 420.58))
        shape.addCurve(to: CGPoint(x: 186.02, y: 416.76), controlPoint1: CGPoint(x: 183.79, y: 416.78), controlPoint2: CGPoint(x: 184.9, y: 416.94))
        shape.addLine(to: CGPoint(x: 200.1, y: 414.52))
        shape.addLine(to: CGPoint(x: 203.28, y: 432.07))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map354() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 354.5, y: 418.23))
        shape.addLine(to: CGPoint(x: 345.68, y: 450.18))
        shape.addCurve(to: CGPoint(x: 318.04, y: 452.71), controlPoint1: CGPoint(x: 323.82, y: 450.18), controlPoint2: CGPoint(x: 320.73, y: 451.06))
        shape.addLine(to: CGPoint(x: 303.48, y: 462.48))
        shape.addCurve(to: CGPoint(x: 299.73, y: 461.67), controlPoint1: CGPoint(x: 302.36, y: 461.86), controlPoint2: CGPoint(x: 301.05, y: 461.57))
        shape.addLine(to: CGPoint(x: 261.36, y: 464.53))
        shape.addLine(to: CGPoint(x: 266.02, y: 453.62))
        shape.addCurve(to: CGPoint(x: 270.09, y: 450.51), controlPoint1: CGPoint(x: 266.72, y: 451.92), controlPoint2: CGPoint(x: 268.28, y: 450.74))
        shape.addLine(to: CGPoint(x: 278.68, y: 449.43))
        shape.addCurve(to: CGPoint(x: 283.09, y: 443.68), controlPoint1: CGPoint(x: 281.5, y: 449.08), controlPoint2: CGPoint(x: 283.48, y: 446.5))
        shape.addLine(to: CGPoint(x: 280.53, y: 424.93))
        shape.addCurve(to: CGPoint(x: 272.23, y: 421.69), controlPoint1: CGPoint(x: 279.99, y: 420.97), controlPoint2: CGPoint(x: 275.31, y: 419.14))
        shape.addLine(to: CGPoint(x: 252.35, y: 438.19))
        shape.addCurve(to: CGPoint(x: 250.51, y: 442.12), controlPoint1: CGPoint(x: 251.19, y: 439.17), controlPoint2: CGPoint(x: 250.51, y: 440.6))
        shape.addLine(to: CGPoint(x: 250.75, y: 465.32))
        shape.addLine(to: CGPoint(x: 244.1, y: 465.81))
        shape.addCurve(to: CGPoint(x: 237.05, y: 460.75), controlPoint1: CGPoint(x: 240.84, y: 466.05), controlPoint2: CGPoint(x: 237.87, y: 463.92))
        shape.addLine(to: CGPoint(x: 233.68, y: 447.7))
        shape.addCurve(to: CGPoint(x: 229.99, y: 443.26), controlPoint1: CGPoint(x: 233.18, y: 445.74), controlPoint2: CGPoint(x: 231.82, y: 444.11))
        shape.addLine(to: CGPoint(x: 207.23, y: 432.62))
        shape.addCurve(to: CGPoint(x: 203.28, y: 432.07), controlPoint1: CGPoint(x: 205.97, y: 432.03), controlPoint2: CGPoint(x: 204.59, y: 431.86))
        shape.addLine(to: CGPoint(x: 200.1, y: 414.52))
        shape.addLine(to: CGPoint(x: 208.92, y: 413.12))
        shape.addCurve(to: CGPoint(x: 213.58, y: 408.86), controlPoint1: CGPoint(x: 211.19, y: 412.76), controlPoint2: CGPoint(x: 213.02, y: 411.08))
        shape.addLine(to: CGPoint(x: 217.51, y: 393.12))
        shape.addCurve(to: CGPoint(x: 214.15, y: 386.46), controlPoint1: CGPoint(x: 218.19, y: 390.38), controlPoint2: CGPoint(x: 216.77, y: 387.54))
        shape.addLine(to: CGPoint(x: 208.07, y: 383.92))
        shape.addCurve(to: CGPoint(x: 204.88, y: 376.7), controlPoint1: CGPoint(x: 205.24, y: 382.76), controlPoint2: CGPoint(x: 203.84, y: 379.57))
        shape.addLine(to: CGPoint(x: 212.56, y: 355.46))
        shape.addCurve(to: CGPoint(x: 212.36, y: 351.1), controlPoint1: CGPoint(x: 213.07, y: 354.04), controlPoint2: CGPoint(x: 213, y: 352.47))
        shape.addLine(to: CGPoint(x: 210.84, y: 347.86))
        shape.addCurve(to: CGPoint(x: 213.5, y: 340.31), controlPoint1: CGPoint(x: 209.52, y: 345.04), controlPoint2: CGPoint(x: 210.71, y: 341.69))
        shape.addLine(to: CGPoint(x: 254.23, y: 320.24))
        shape.addCurve(to: CGPoint(x: 255.93, y: 318.96), controlPoint1: CGPoint(x: 254.87, y: 319.92), controlPoint2: CGPoint(x: 255.45, y: 319.5))
        shape.addLine(to: CGPoint(x: 279.29, y: 293.24))
        shape.addLine(to: CGPoint(x: 285.29, y: 296.38))
        shape.addCurve(to: CGPoint(x: 292.49, y: 297.91), controlPoint1: CGPoint(x: 287.51, y: 297.53), controlPoint2: CGPoint(x: 289.99, y: 298.06))
        shape.addLine(to: CGPoint(x: 345.6, y: 294.54))
        shape.addLine(to: CGPoint(x: 342.98, y: 409.1))
        shape.addCurve(to: CGPoint(x: 347.23, y: 413.46), controlPoint1: CGPoint(x: 342.93, y: 411.6), controlPoint2: CGPoint(x: 344.96, y: 413.46))
        shape.addCurve(to: CGPoint(x: 348.82, y: 413.15), controlPoint1: CGPoint(x: 347.75, y: 413.46), controlPoint2: CGPoint(x: 348.29, y: 413.36))
        shape.addCurve(to: CGPoint(x: 354.5, y: 418.23), controlPoint1: CGPoint(x: 352.09, y: 411.84), controlPoint2: CGPoint(x: 355.44, y: 414.85))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map324() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 324.85, y: 482.24))
        shape.addLine(to: CGPoint(x: 298.38, y: 505.03))
        shape.addCurve(to: CGPoint(x: 295.4, y: 510.96), controlPoint1: CGPoint(x: 296.63, y: 506.53), controlPoint2: CGPoint(x: 295.56, y: 508.67))
        shape.addLine(to: CGPoint(x: 294.19, y: 528.32))
        shape.addLine(to: CGPoint(x: 265.84, y: 519.39))
        shape.addCurve(to: CGPoint(x: 260.77, y: 521.51), controlPoint1: CGPoint(x: 263.86, y: 518.76), controlPoint2: CGPoint(x: 261.71, y: 519.66))
        shape.addLine(to: CGPoint(x: 251.63, y: 539.43))
        shape.addCurve(to: CGPoint(x: 247.44, y: 541.73), controlPoint1: CGPoint(x: 250.84, y: 540.99), controlPoint2: CGPoint(x: 249.18, y: 541.9))
        shape.addLine(to: CGPoint(x: 225.34, y: 539.6))
        shape.addCurve(to: CGPoint(x: 221.5, y: 535.36), controlPoint1: CGPoint(x: 223.15, y: 539.38), controlPoint2: CGPoint(x: 221.5, y: 537.55))
        shape.addCurve(to: CGPoint(x: 215.81, y: 531.02), controlPoint1: CGPoint(x: 221.5, y: 532.09), controlPoint2: CGPoint(x: 218.58, y: 530.04))
        shape.addLine(to: CGPoint(x: 199.04, y: 537))
        shape.addLine(to: CGPoint(x: 184.87, y: 524.57))
        shape.addCurve(to: CGPoint(x: 181.47, y: 518.2), controlPoint1: CGPoint(x: 183, y: 522.93), controlPoint2: CGPoint(x: 181.8, y: 520.66))
        shape.addLine(to: CGPoint(x: 179.08, y: 500.02))
        shape.addCurve(to: CGPoint(x: 181.97, y: 494.47), controlPoint1: CGPoint(x: 180.83, y: 498.8), controlPoint2: CGPoint(x: 181.97, y: 496.78))
        shape.addCurve(to: CGPoint(x: 184.05, y: 448.88), controlPoint1: CGPoint(x: 181.97, y: 451.92), controlPoint2: CGPoint(x: 182.73, y: 450.16))
        shape.addLine(to: CGPoint(x: 199.67, y: 433.88))
        shape.addCurve(to: CGPoint(x: 203.28, y: 432.07), controlPoint1: CGPoint(x: 200.69, y: 432.9), controlPoint2: CGPoint(x: 201.95, y: 432.29))
        shape.addCurve(to: CGPoint(x: 207.23, y: 432.62), controlPoint1: CGPoint(x: 204.59, y: 431.86), controlPoint2: CGPoint(x: 205.97, y: 432.03))
        shape.addLine(to: CGPoint(x: 229.99, y: 443.26))
        shape.addCurve(to: CGPoint(x: 233.68, y: 447.7), controlPoint1: CGPoint(x: 231.82, y: 444.11), controlPoint2: CGPoint(x: 233.18, y: 445.74))
        shape.addLine(to: CGPoint(x: 237.05, y: 460.75))
        shape.addCurve(to: CGPoint(x: 244.1, y: 465.81), controlPoint1: CGPoint(x: 237.87, y: 463.92), controlPoint2: CGPoint(x: 240.84, y: 466.05))
        shape.addLine(to: CGPoint(x: 250.75, y: 465.32))
        shape.addLine(to: CGPoint(x: 261.36, y: 464.53))
        shape.addLine(to: CGPoint(x: 299.73, y: 461.67))
        shape.addCurve(to: CGPoint(x: 303.48, y: 462.48), controlPoint1: CGPoint(x: 301.05, y: 461.57), controlPoint2: CGPoint(x: 302.36, y: 461.86))
        shape.addCurve(to: CGPoint(x: 306.13, y: 465.09), controlPoint1: CGPoint(x: 304.57, y: 463.07), controlPoint2: CGPoint(x: 305.49, y: 463.97))
        shape.addLine(to: CGPoint(x: 309.5, y: 471.09))
        shape.addCurve(to: CGPoint(x: 311.63, y: 473.4), controlPoint1: CGPoint(x: 310.02, y: 472.02), controlPoint2: CGPoint(x: 310.75, y: 472.81))
        shape.addLine(to: CGPoint(x: 324.85, y: 482.24))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map184() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 184.87, y: 524.57))
        shape.addCurve(to: CGPoint(x: 181.47, y: 518.2), controlPoint1: CGPoint(x: 183, y: 522.93), controlPoint2: CGPoint(x: 181.8, y: 520.66))
        shape.addLine(to: CGPoint(x: 179.08, y: 500.02))
        shape.addCurve(to: CGPoint(x: 174.67, y: 501.22), controlPoint1: CGPoint(x: 177.85, y: 500.88), controlPoint2: CGPoint(x: 176.31, y: 501.35))
        shape.addLine(to: CGPoint(x: 135.21, y: 498.11))
        shape.addCurve(to: CGPoint(x: 128.97, y: 491.36), controlPoint1: CGPoint(x: 131.69, y: 497.82), controlPoint2: CGPoint(x: 128.97, y: 494.88))
        shape.addCurve(to: CGPoint(x: 125.69, y: 479.25), controlPoint1: CGPoint(x: 128.97, y: 482.67), controlPoint2: CGPoint(x: 127.73, y: 480.47))
        shape.addLine(to: CGPoint(x: 112.56, y: 471.37))
        shape.addCurve(to: CGPoint(x: 103.03, y: 474.12), controlPoint1: CGPoint(x: 109.18, y: 469.34), controlPoint2: CGPoint(x: 104.8, y: 470.62))
        shape.addLine(to: CGPoint(x: 95.91, y: 488.24))
        shape.addCurve(to: CGPoint(x: 86.33, y: 490.97), controlPoint1: CGPoint(x: 94.13, y: 491.79), controlPoint2: CGPoint(x: 89.7, y: 493.04))
        shape.addLine(to: CGPoint(x: 72.04, y: 482.2))
        shape.addLine(to: CGPoint(x: 46.07, y: 530.85))
        shape.addCurve(to: CGPoint(x: 46.36, y: 535.33), controlPoint1: CGPoint(x: 45.3, y: 532.28), controlPoint2: CGPoint(x: 45.42, y: 534.01))
        shape.addLine(to: CGPoint(x: 57.5, y: 550.92))
        shape.addCurve(to: CGPoint(x: 58.06, y: 554.78), controlPoint1: CGPoint(x: 58.29, y: 552.04), controlPoint2: CGPoint(x: 58.5, y: 553.48))
        shape.addLine(to: CGPoint(x: 53.74, y: 567.4))
        shape.addCurve(to: CGPoint(x: 55.27, y: 572.22), controlPoint1: CGPoint(x: 53.14, y: 569.16), controlPoint2: CGPoint(x: 53.76, y: 571.12))
        shape.addLine(to: CGPoint(x: 70.03, y: 582.92))
        shape.addCurve(to: CGPoint(x: 71.68, y: 585.42), controlPoint1: CGPoint(x: 70.87, y: 583.52), controlPoint2: CGPoint(x: 71.45, y: 584.42))
        shape.addLine(to: CGPoint(x: 75.4, y: 601.68))
        shape.addCurve(to: CGPoint(x: 80.84, y: 604.78), controlPoint1: CGPoint(x: 75.96, y: 604.1), controlPoint2: CGPoint(x: 78.47, y: 605.53))
        shape.addLine(to: CGPoint(x: 119.7, y: 592.49))
        shape.addCurve(to: CGPoint(x: 122.56, y: 589.4), controlPoint1: CGPoint(x: 121.13, y: 592.04), controlPoint2: CGPoint(x: 122.21, y: 590.87))
        shape.addLine(to: CGPoint(x: 128.45, y: 564.26))
        shape.addCurve(to: CGPoint(x: 131.16, y: 561.22), controlPoint1: CGPoint(x: 128.77, y: 562.85), controlPoint2: CGPoint(x: 129.79, y: 561.72))
        shape.addLine(to: CGPoint(x: 199.04, y: 537))
        shape.addLine(to: CGPoint(x: 184.87, y: 524.57))
        shape.close()
        shape.move(to: CGPoint(x: 123.44, y: 521.49))
        shape.addLine(to: CGPoint(x: 104.51, y: 526.66))
        shape.addCurve(to: CGPoint(x: 98.52, y: 525.12), controlPoint1: CGPoint(x: 102.38, y: 527.24), controlPoint2: CGPoint(x: 100.1, y: 526.66))
        shape.addLine(to: CGPoint(x: 95.84, y: 522.54))
        shape.addCurve(to: CGPoint(x: 94.56, y: 515.33), controlPoint1: CGPoint(x: 93.9, y: 520.66), controlPoint2: CGPoint(x: 93.39, y: 517.76))
        shape.addLine(to: CGPoint(x: 99.7, y: 504.65))
        shape.addCurve(to: CGPoint(x: 104.2, y: 501.22), controlPoint1: CGPoint(x: 100.57, y: 502.86), controlPoint2: CGPoint(x: 102.24, y: 501.58))
        shape.addLine(to: CGPoint(x: 112.89, y: 499.64))
        shape.addCurve(to: CGPoint(x: 118.66, y: 501.6), controlPoint1: CGPoint(x: 115.03, y: 499.24), controlPoint2: CGPoint(x: 117.21, y: 499.99))
        shape.addLine(to: CGPoint(x: 125, y: 508.66))
        shape.addCurve(to: CGPoint(x: 125.83, y: 509.83), controlPoint1: CGPoint(x: 125.32, y: 509.02), controlPoint2: CGPoint(x: 125.61, y: 509.41))
        shape.addLine(to: CGPoint(x: 127.27, y: 512.46))
        shape.addCurve(to: CGPoint(x: 123.44, y: 521.49), controlPoint1: CGPoint(x: 129.2, y: 516), controlPoint2: CGPoint(x: 127.33, y: 520.42))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map334() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 334.95, y: 489))
        shape.addLine(to: CGPoint(x: 328.25, y: 513.26))
        shape.addCurve(to: CGPoint(x: 324.7, y: 516.34), controlPoint1: CGPoint(x: 327.8, y: 514.9), controlPoint2: CGPoint(x: 326.39, y: 516.12))
        shape.addLine(to: CGPoint(x: 311, y: 518.15))
        shape.addCurve(to: CGPoint(x: 308.9, y: 519.03), controlPoint1: CGPoint(x: 310.23, y: 518.25), controlPoint2: CGPoint(x: 309.51, y: 518.56))
        shape.addLine(to: CGPoint(x: 298.11, y: 527.59))
        shape.addCurve(to: CGPoint(x: 294.19, y: 528.32), controlPoint1: CGPoint(x: 297.01, y: 528.47), controlPoint2: CGPoint(x: 295.54, y: 528.74))
        shape.addLine(to: CGPoint(x: 295.4, y: 510.96))
        shape.addCurve(to: CGPoint(x: 298.38, y: 505.03), controlPoint1: CGPoint(x: 295.56, y: 508.67), controlPoint2: CGPoint(x: 296.63, y: 506.53))
        shape.addLine(to: CGPoint(x: 324.85, y: 482.23))
        shape.addLine(to: CGPoint(x: 334.95, y: 489))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map3450() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 345.68, y: 450.18))
        shape.addLine(to: CGPoint(x: 334.95, y: 489))
        shape.addLine(to: CGPoint(x: 324.85, y: 482.23))
        shape.addLine(to: CGPoint(x: 311.63, y: 473.4))
        shape.addCurve(to: CGPoint(x: 309.5, y: 471.09), controlPoint1: CGPoint(x: 310.75, y: 472.81), controlPoint2: CGPoint(x: 310.02, y: 472.02))
        shape.addLine(to: CGPoint(x: 306.13, y: 465.09))
        shape.addCurve(to: CGPoint(x: 303.48, y: 462.48), controlPoint1: CGPoint(x: 305.49, y: 463.97), controlPoint2: CGPoint(x: 304.57, y: 463.07))
        shape.addLine(to: CGPoint(x: 318.04, y: 452.71))
        shape.addCurve(to: CGPoint(x: 326.97, y: 450.18), controlPoint1: CGPoint(x: 320.73, y: 451.06), controlPoint2: CGPoint(x: 323.82, y: 450.18))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map78() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 78.35, y: 256.12))
        shape.addLine(to: CGPoint(x: 71.8, y: 259.51))
        shape.addCurve(to: CGPoint(x: 67.92, y: 258.6), controlPoint1: CGPoint(x: 70.45, y: 260.2), controlPoint2: CGPoint(x: 68.81, y: 259.82))
        shape.addLine(to: CGPoint(x: 64.68, y: 254.13))
        shape.addCurve(to: CGPoint(x: 66.39, y: 249.38), controlPoint1: CGPoint(x: 63.4, y: 252.38), controlPoint2: CGPoint(x: 64.29, y: 249.9))
        shape.addLine(to: CGPoint(x: 71.77, y: 248))
        shape.addCurve(to: CGPoint(x: 74.01, y: 248.29), controlPoint1: CGPoint(x: 72.52, y: 247.81), controlPoint2: CGPoint(x: 73.33, y: 247.91))
        shape.addLine(to: CGPoint(x: 78.42, y: 250.74))
        shape.addCurve(to: CGPoint(x: 78.35, y: 256.12), controlPoint1: CGPoint(x: 80.56, y: 251.93), controlPoint2: CGPoint(x: 80.51, y: 255))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map113() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 113.95, y: 654.71))
        shape.addLine(to: CGPoint(x: 103.51, y: 664.4))
        shape.addCurve(to: CGPoint(x: 100.28, y: 666.16), controlPoint1: CGPoint(x: 102.6, y: 665.24), controlPoint2: CGPoint(x: 101.5, y: 665.85))
        shape.addLine(to: CGPoint(x: 56.12, y: 677.44))
        shape.addCurve(to: CGPoint(x: 48.56, y: 674.99), controlPoint1: CGPoint(x: 53.33, y: 678.14), controlPoint2: CGPoint(x: 50.39, y: 677.19))
        shape.addLine(to: CGPoint(x: 43.43, y: 668.84))
        shape.addCurve(to: CGPoint(x: 43.55, y: 659.16), controlPoint1: CGPoint(x: 41.09, y: 666.02), controlPoint2: CGPoint(x: 41.14, y: 661.92))
        shape.addLine(to: CGPoint(x: 55.03, y: 646.07))
        shape.addCurve(to: CGPoint(x: 59.42, y: 643.64), controlPoint1: CGPoint(x: 56.17, y: 644.78), controlPoint2: CGPoint(x: 57.72, y: 643.92))
        shape.addLine(to: CGPoint(x: 98.61, y: 637.15))
        shape.addCurve(to: CGPoint(x: 103.29, y: 637.91), controlPoint1: CGPoint(x: 100.21, y: 636.89), controlPoint2: CGPoint(x: 101.85, y: 637.15))
        shape.addLine(to: CGPoint(x: 112.35, y: 642.67))
        shape.addCurve(to: CGPoint(x: 113.95, y: 654.71), controlPoint1: CGPoint(x: 116.89, y: 645.06), controlPoint2: CGPoint(x: 117.71, y: 651.22))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map166() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 166.99, y: 579.31))
        shape.addLine(to: CGPoint(x: 155.74, y: 588.13))
        shape.addCurve(to: CGPoint(x: 152.13, y: 588.63), controlPoint1: CGPoint(x: 154.71, y: 588.94), controlPoint2: CGPoint(x: 153.33, y: 589.13))
        shape.addLine(to: CGPoint(x: 137.63, y: 582.63))
        shape.addCurve(to: CGPoint(x: 135.86, y: 577.5), controlPoint1: CGPoint(x: 135.62, y: 581.8), controlPoint2: CGPoint(x: 134.79, y: 579.4))
        shape.addLine(to: CGPoint(x: 142.19, y: 566.26))
        shape.addCurve(to: CGPoint(x: 145.1, y: 564.43), controlPoint1: CGPoint(x: 142.79, y: 565.2), controlPoint2: CGPoint(x: 143.89, y: 564.51))
        shape.addLine(to: CGPoint(x: 160.36, y: 563.35))
        shape.addCurve(to: CGPoint(x: 163.94, y: 565.51), controlPoint1: CGPoint(x: 161.89, y: 563.24), controlPoint2: CGPoint(x: 163.33, y: 564.11))
        shape.addLine(to: CGPoint(x: 168.07, y: 575.02))
        shape.addCurve(to: CGPoint(x: 166.99, y: 579.31), controlPoint1: CGPoint(x: 168.73, y: 576.53), controlPoint2: CGPoint(x: 168.28, y: 578.3))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map61() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 61.95, y: 590.78))
        shape.addLine(to: CGPoint(x: 60.35, y: 597.26))
        shape.addCurve(to: CGPoint(x: 55.81, y: 601.18), controlPoint1: CGPoint(x: 59.82, y: 599.39), controlPoint2: CGPoint(x: 58, y: 600.97))
        shape.addLine(to: CGPoint(x: 45.43, y: 602.18))
        shape.addCurve(to: CGPoint(x: 40.76, y: 600.11), controlPoint1: CGPoint(x: 43.62, y: 602.35), controlPoint2: CGPoint(x: 41.84, y: 601.56))
        shape.addLine(to: CGPoint(x: 40.37, y: 599.58))
        shape.addCurve(to: CGPoint(x: 40.66, y: 593.02), controlPoint1: CGPoint(x: 38.9, y: 597.6), controlPoint2: CGPoint(x: 39.02, y: 594.86))
        shape.addLine(to: CGPoint(x: 49.54, y: 583.04))
        shape.addCurve(to: CGPoint(x: 56.84, y: 582.58), controlPoint1: CGPoint(x: 51.44, y: 580.92), controlPoint2: CGPoint(x: 54.69, y: 580.71))
        shape.addLine(to: CGPoint(x: 60.32, y: 585.61))
        shape.addCurve(to: CGPoint(x: 61.95, y: 590.78), controlPoint1: CGPoint(x: 61.79, y: 586.89), controlPoint2: CGPoint(x: 62.43, y: 588.89))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map279() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 279.29, y: 293.24))
        shape.addLine(to: CGPoint(x: 255.93, y: 318.96))
        shape.addCurve(to: CGPoint(x: 254.23, y: 320.24), controlPoint1: CGPoint(x: 255.45, y: 319.49), controlPoint2: CGPoint(x: 254.87, y: 319.92))
        shape.addLine(to: CGPoint(x: 213.5, y: 340.31))
        shape.addCurve(to: CGPoint(x: 210.84, y: 347.86), controlPoint1: CGPoint(x: 210.71, y: 341.68), controlPoint2: CGPoint(x: 209.52, y: 345.04))
        shape.addLine(to: CGPoint(x: 212.36, y: 351.1))
        shape.addCurve(to: CGPoint(x: 212.56, y: 355.46), controlPoint1: CGPoint(x: 213, y: 352.47), controlPoint2: CGPoint(x: 213.07, y: 354.04))
        shape.addLine(to: CGPoint(x: 204.88, y: 376.7))
        shape.addCurve(to: CGPoint(x: 208.07, y: 383.92), controlPoint1: CGPoint(x: 203.84, y: 379.57), controlPoint2: CGPoint(x: 205.24, y: 382.76))
        shape.addLine(to: CGPoint(x: 214.15, y: 386.46))
        shape.addCurve(to: CGPoint(x: 217.51, y: 393.12), controlPoint1: CGPoint(x: 216.77, y: 387.54), controlPoint2: CGPoint(x: 218.19, y: 390.38))
        shape.addLine(to: CGPoint(x: 213.58, y: 408.85))
        shape.addCurve(to: CGPoint(x: 208.92, y: 413.12), controlPoint1: CGPoint(x: 213.02, y: 411.08), controlPoint2: CGPoint(x: 211.19, y: 412.76))
        shape.addLine(to: CGPoint(x: 200.1, y: 414.52))
        shape.addLine(to: CGPoint(x: 186.02, y: 416.76))
        shape.addCurve(to: CGPoint(x: 182.81, y: 416.34), controlPoint1: CGPoint(x: 184.9, y: 416.94), controlPoint2: CGPoint(x: 183.79, y: 416.78))
        shape.addCurve(to: CGPoint(x: 180.06, y: 413.78), controlPoint1: CGPoint(x: 181.66, y: 415.84), controlPoint2: CGPoint(x: 180.68, y: 414.95))
        shape.addLine(to: CGPoint(x: 169.34, y: 393.42))
        shape.addCurve(to: CGPoint(x: 168.7, y: 391.23), controlPoint1: CGPoint(x: 168.97, y: 392.74), controlPoint2: CGPoint(x: 168.76, y: 391.99))
        shape.addCurve(to: CGPoint(x: 168.8, y: 389.58), controlPoint1: CGPoint(x: 168.65, y: 390.68), controlPoint2: CGPoint(x: 168.68, y: 390.13))
        shape.addLine(to: CGPoint(x: 172.95, y: 369.81))
        shape.addCurve(to: CGPoint(x: 171.27, y: 364.47), controlPoint1: CGPoint(x: 173.36, y: 367.85), controlPoint2: CGPoint(x: 172.72, y: 365.83))
        shape.addLine(to: CGPoint(x: 168.37, y: 361.75))
        shape.addLine(to: CGPoint(x: 155.01, y: 349.21))
        shape.addCurve(to: CGPoint(x: 153.61, y: 347.14), controlPoint1: CGPoint(x: 154.39, y: 348.61), controlPoint2: CGPoint(x: 153.91, y: 347.9))
        shape.addCurve(to: CGPoint(x: 153.83, y: 342.44), controlPoint1: CGPoint(x: 153.02, y: 345.65), controlPoint2: CGPoint(x: 153.07, y: 343.93))
        shape.addLine(to: CGPoint(x: 156.03, y: 338.1))
        shape.addCurve(to: CGPoint(x: 154.26, y: 330.85), controlPoint1: CGPoint(x: 157.32, y: 335.57), controlPoint2: CGPoint(x: 156.56, y: 332.5))
        shape.addLine(to: CGPoint(x: 144.55, y: 320.3))
        shape.addCurve(to: CGPoint(x: 149.24, y: 318.78), controlPoint1: CGPoint(x: 146.18, y: 320.34), controlPoint2: CGPoint(x: 147.84, y: 319.85))
        shape.addLine(to: CGPoint(x: 185.76, y: 290.99))
        shape.addLine(to: CGPoint(x: 205.94, y: 291.07))
        shape.addCurve(to: CGPoint(x: 213.26, y: 289.16), controlPoint1: CGPoint(x: 208.5, y: 291.13), controlPoint2: CGPoint(x: 211.04, y: 290.48))
        shape.addLine(to: CGPoint(x: 234.01, y: 276.91))
        shape.addCurve(to: CGPoint(x: 247.3, y: 276.55), controlPoint1: CGPoint(x: 238.08, y: 274.5), controlPoint2: CGPoint(x: 243.1, y: 274.37))
        shape.addLine(to: CGPoint(x: 279.29, y: 293.24))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map278() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 278.68, y: 449.43))
        shape.addLine(to: CGPoint(x: 270.09, y: 450.51))
        shape.addCurve(to: CGPoint(x: 266.02, y: 453.62), controlPoint1: CGPoint(x: 268.28, y: 450.74), controlPoint2: CGPoint(x: 266.72, y: 451.92))
        shape.addLine(to: CGPoint(x: 261.36, y: 464.53))
        shape.addLine(to: CGPoint(x: 250.75, y: 465.32))
        shape.addLine(to: CGPoint(x: 250.51, y: 442.12))
        shape.addCurve(to: CGPoint(x: 252.35, y: 438.19), controlPoint1: CGPoint(x: 250.51, y: 440.6), controlPoint2: CGPoint(x: 251.19, y: 439.17))
        shape.addLine(to: CGPoint(x: 272.23, y: 421.69))
        shape.addCurve(to: CGPoint(x: 280.53, y: 424.93), controlPoint1: CGPoint(x: 275.31, y: 419.14), controlPoint2: CGPoint(x: 279.99, y: 420.97))
        shape.addLine(to: CGPoint(x: 283.09, y: 443.68))
        shape.addCurve(to: CGPoint(x: 278.68, y: 449.43), controlPoint1: CGPoint(x: 283.48, y: 446.5), controlPoint2: CGPoint(x: 281.5, y: 449.08))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map123() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 123.44, y: 521.49))
        shape.addLine(to: CGPoint(x: 104.51, y: 526.66))
        shape.addCurve(to: CGPoint(x: 98.52, y: 525.12), controlPoint1: CGPoint(x: 102.38, y: 527.24), controlPoint2: CGPoint(x: 100.1, y: 526.66))
        shape.addLine(to: CGPoint(x: 95.84, y: 522.54))
        shape.addCurve(to: CGPoint(x: 94.56, y: 515.33), controlPoint1: CGPoint(x: 93.9, y: 520.66), controlPoint2: CGPoint(x: 93.39, y: 517.76))
        shape.addLine(to: CGPoint(x: 99.7, y: 504.65))
        shape.addCurve(to: CGPoint(x: 104.2, y: 501.22), controlPoint1: CGPoint(x: 100.57, y: 502.86), controlPoint2: CGPoint(x: 102.24, y: 501.58))
        shape.addLine(to: CGPoint(x: 112.89, y: 499.64))
        shape.addCurve(to: CGPoint(x: 118.66, y: 501.6), controlPoint1: CGPoint(x: 115.03, y: 499.24), controlPoint2: CGPoint(x: 117.21, y: 499.99))
        shape.addLine(to: CGPoint(x: 125, y: 508.66))
        shape.addCurve(to: CGPoint(x: 125.83, y: 509.83), controlPoint1: CGPoint(x: 125.32, y: 509.02), controlPoint2: CGPoint(x: 125.61, y: 509.42))
        shape.addLine(to: CGPoint(x: 127.27, y: 512.47))
        shape.addCurve(to: CGPoint(x: 123.44, y: 521.49), controlPoint1: CGPoint(x: 129.2, y: 516), controlPoint2: CGPoint(x: 127.33, y: 520.42))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func map144() -> CALayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 144.87, y: 250.61))
        shape.addLine(to: CGPoint(x: 137.2, y: 257.67))
        shape.addCurve(to: CGPoint(x: 133.27, y: 258.08), controlPoint1: CGPoint(x: 136.13, y: 258.66), controlPoint2: CGPoint(x: 134.53, y: 258.83))
        shape.addLine(to: CGPoint(x: 127.82, y: 254.85))
        shape.addCurve(to: CGPoint(x: 124.52, y: 254.8), controlPoint1: CGPoint(x: 126.81, y: 254.25), controlPoint2: CGPoint(x: 125.55, y: 254.23))
        shape.addLine(to: CGPoint(x: 120.09, y: 257.25))
        shape.addCurve(to: CGPoint(x: 115.27, y: 255.17), controlPoint1: CGPoint(x: 118.18, y: 258.31), controlPoint2: CGPoint(x: 115.8, y: 257.28))
        shape.addLine(to: CGPoint(x: 112.61, y: 244.74))
        shape.addCurve(to: CGPoint(x: 114.88, y: 240.74), controlPoint1: CGPoint(x: 112.18, y: 243.01), controlPoint2: CGPoint(x: 113.18, y: 241.25))
        shape.addCurve(to: CGPoint(x: 116.33, y: 239.85), controlPoint1: CGPoint(x: 115.44, y: 240.58), controlPoint2: CGPoint(x: 115.94, y: 240.27))
        shape.addLine(to: CGPoint(x: 124.74, y: 231.05))
        shape.addCurve(to: CGPoint(x: 127.13, y: 230.03), controlPoint1: CGPoint(x: 125.37, y: 230.4), controlPoint2: CGPoint(x: 126.23, y: 230.03))
        shape.addCurve(to: CGPoint(x: 139.44, y: 233.35), controlPoint1: CGPoint(x: 137.95, y: 230.03), controlPoint2: CGPoint(x: 139.44, y: 231.51))
        shape.addLine(to: CGPoint(x: 144.61, y: 245.51))
        shape.addCurve(to: CGPoint(x: 144.87, y: 250.61), controlPoint1: CGPoint(x: 146.27, y: 246.75), controlPoint2: CGPoint(x: 146.4, y: 249.2))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
}

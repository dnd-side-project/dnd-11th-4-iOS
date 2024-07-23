//
//  ViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/18/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawMap()
    }
    
    func drawMap() {
        let ScrollerView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 800, height: 812))
        ScrollerView.contentSize = CGSize(width: 800, height: 812)
        let targetRect = CGRect(x: 0, y: 0, width: 0, height: 0)
        ScrollerView.scrollRectToVisible(targetRect, animated: true)
        ScrollerView.backgroundColor = .systemPink
        view.addSubview(ScrollerView)

        let mapView = UIView()
        mapView.backgroundColor = .systemPink
        
        기기대응메서드()
        
        func 기기대응메서드() {
            if UIScreen.main.bounds.size.width == 375 {
                mapView.frame = CGRect(x: 0, y: 0, width: 800, height: 812)
            } else if UIScreen.main.bounds.size.width == 430 {
                mapView.frame = CGRect(x: 25, y: 25, width: 800, height: 812)
            }
        }
    
        ScrollerView.addSubview(mapView)
        
        mapView.layer.addSublayer(경기())
        mapView.layer.addSublayer(인천())
        mapView.layer.addSublayer(충남())
        mapView.layer.addSublayer(강원())
        mapView.layer.addSublayer(대전())
        mapView.layer.addSublayer(세종())
        mapView.layer.addSublayer(전북())
        mapView.layer.addSublayer(경북())
        mapView.layer.addSublayer(경남())
        mapView.layer.addSublayer(전남())
        mapView.layer.addSublayer(부산())
        mapView.layer.addSublayer(울산())
        mapView.layer.addSublayer(영종도())
        mapView.layer.addSublayer(제주())
        mapView.layer.addSublayer(고흥())
        mapView.layer.addSublayer(충북())
        mapView.layer.addSublayer(대구())
        mapView.layer.addSublayer(광주())
        mapView.layer.addSublayer(서울())
        mapView.layer.addSublayer(진도())
    }
    
    func 경기() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 179.26, y: 249.88))
        shape.addCurve(to: CGPoint(x: 166.66, y: 244.61), controlPoint1: CGPoint(x: 170.47, y: 249.88), controlPoint2: CGPoint(x: 167.59, y: 247.74))
        shape.addLine(to: CGPoint(x: 162.03, y: 229.25))
        shape.addCurve(to: CGPoint(x: 162.28, y: 224.29), controlPoint1: CGPoint(x: 161.54, y: 227.62), controlPoint2: CGPoint(x: 161.62, y: 225.86))
        shape.addLine(to: CGPoint(x: 169.5, y: 206.81))
        shape.addCurve(to: CGPoint(x: 166.97, y: 197.97), controlPoint1: CGPoint(x: 170.8, y: 203.63), controlPoint2: CGPoint(x: 169.76, y: 199.97))
        shape.addLine(to: CGPoint(x: 122.3, y: 165.87))
        shape.addLine(to: CGPoint(x: 85.08, y: 213.05))
        shape.addCurve(to: CGPoint(x: 81.33, y: 214.65), controlPoint1: CGPoint(x: 84.18, y: 214.19), controlPoint2: CGPoint(x: 82.77, y: 214.79))
        shape.addLine(to: CGPoint(x: 64.05, y: 213.02))
        shape.addCurve(to: CGPoint(x: 59.41, y: 217.6), controlPoint1: CGPoint(x: 61.41, y: 212.77), controlPoint2: CGPoint(x: 59.19, y: 214.96))
        shape.addLine(to: CGPoint(x: 60.54, y: 231.42))
        shape.addCurve(to: CGPoint(x: 64.78, y: 235.33), controlPoint1: CGPoint(x: 60.72, y: 233.63), controlPoint2: CGPoint(x: 62.56, y: 235.33))
        shape.addCurve(to: CGPoint(x: 75.85, y: 237.11), controlPoint1: CGPoint(x: 73.81, y: 235.33), controlPoint2: CGPoint(x: 75.07, y: 236.02))
        shape.addLine(to: CGPoint(x: 84.08, y: 231.65))
        shape.addCurve(to: CGPoint(x: 89.16, y: 231.55), controlPoint1: CGPoint(x: 85.6, y: 230.63), controlPoint2: CGPoint(x: 87.59, y: 230.6))
        shape.addLine(to: CGPoint(x: 93.69, y: 234.31))
        shape.addCurve(to: CGPoint(x: 95.92, y: 238.96), controlPoint1: CGPoint(x: 95.28, y: 235.29), controlPoint2: CGPoint(x: 96.16, y: 237.1))
        shape.addLine(to: CGPoint(x: 93.46, y: 258.35))
        shape.addCurve(to: CGPoint(x: 91.16, y: 261.85), controlPoint1: CGPoint(x: 93.28, y: 259.82), controlPoint2: CGPoint(x: 92.42, y: 261.1))
        shape.addLine(to: CGPoint(x: 83.32, y: 266.44))
        shape.addLine(to: CGPoint(x: 87.38, y: 268.34))
        shape.addCurve(to: CGPoint(x: 87.89, y: 275.76), controlPoint1: CGPoint(x: 90.41, y: 269.76), controlPoint2: CGPoint(x: 90.69, y: 273.95))
        shape.addLine(to: CGPoint(x: 82.46, y: 279.27))
        shape.addCurve(to: CGPoint(x: 81.44, y: 285.49), controlPoint1: CGPoint(x: 80.35, y: 280.64), controlPoint2: CGPoint(x: 79.88, y: 283.53))
        shape.addLine(to: CGPoint(x: 86.02, y: 291.27))
        shape.addCurve(to: CGPoint(x: 86.57, y: 295.66), controlPoint1: CGPoint(x: 87.1, y: 292.62), controlPoint2: CGPoint(x: 87.18, y: 294.3))
        shape.addLine(to: CGPoint(x: 119.64, y: 303.98))
        shape.addCurve(to: CGPoint(x: 123.71, y: 306.65), controlPoint1: CGPoint(x: 121.26, y: 304.39), controlPoint2: CGPoint(x: 122.7, y: 305.33))
        shape.addLine(to: CGPoint(x: 128.89, y: 313.4))
        shape.addCurve(to: CGPoint(x: 134.55, y: 316.3), controlPoint1: CGPoint(x: 130.3, y: 315.23), controlPoint2: CGPoint(x: 132.4, y: 316.23))
        shape.addCurve(to: CGPoint(x: 139.24, y: 314.79), controlPoint1: CGPoint(x: 136.18, y: 316.34), controlPoint2: CGPoint(x: 137.84, y: 315.85))
        shape.addLine(to: CGPoint(x: 175.76, y: 286.99))
        shape.addLine(to: CGPoint(x: 178.06, y: 285.24))
        shape.addCurve(to: CGPoint(x: 180.74, y: 281.2), controlPoint1: CGPoint(x: 179.38, y: 284.23), controlPoint2: CGPoint(x: 180.32, y: 282.81))
        shape.addLine(to: CGPoint(x: 186.42, y: 259.12))
        shape.addCurve(to: CGPoint(x: 179.26, y: 249.88), controlPoint1: CGPoint(x: 187.62, y: 254.44), controlPoint2: CGPoint(x: 184.09, y: 249.88))
        shape.close()
        shape.move(to: CGPoint(x: 134.87, y: 246.61))
        shape.addLine(to: CGPoint(x: 127.21, y: 253.67))
        shape.addCurve(to: CGPoint(x: 123.27, y: 254.08), controlPoint1: CGPoint(x: 126.13, y: 254.66), controlPoint2: CGPoint(x: 124.53, y: 254.83))
        shape.addLine(to: CGPoint(x: 117.82, y: 250.85))
        shape.addCurve(to: CGPoint(x: 114.52, y: 250.8), controlPoint1: CGPoint(x: 116.81, y: 250.25), controlPoint2: CGPoint(x: 115.55, y: 250.23))
        shape.addLine(to: CGPoint(x: 110.09, y: 253.25))
        shape.addCurve(to: CGPoint(x: 105.27, y: 251.17), controlPoint1: CGPoint(x: 108.19, y: 254.31), controlPoint2: CGPoint(x: 105.8, y: 253.28))
        shape.addLine(to: CGPoint(x: 102.61, y: 240.74))
        shape.addCurve(to: CGPoint(x: 104.88, y: 236.74), controlPoint1: CGPoint(x: 102.18, y: 239.01), controlPoint2: CGPoint(x: 103.18, y: 237.25))
        shape.addCurve(to: CGPoint(x: 106.33, y: 235.85), controlPoint1: CGPoint(x: 105.44, y: 236.58), controlPoint2: CGPoint(x: 105.94, y: 236.27))
        shape.addLine(to: CGPoint(x: 114.74, y: 227.06))
        shape.addCurve(to: CGPoint(x: 117.14, y: 226.03), controlPoint1: CGPoint(x: 115.37, y: 226.4), controlPoint2: CGPoint(x: 116.23, y: 226.03))
        shape.addCurve(to: CGPoint(x: 129.44, y: 229.35), controlPoint1: CGPoint(x: 127.95, y: 226.03), controlPoint2: CGPoint(x: 129.44, y: 227.51))
        shape.addLine(to: CGPoint(x: 134.61, y: 241.51))
        shape.addCurve(to: CGPoint(x: 134.87, y: 246.61), controlPoint1: CGPoint(x: 136.27, y: 242.75), controlPoint2: CGPoint(x: 136.4, y: 245.2))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 인천() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 95.92, y: 238.96))
        shape.addLine(to: CGPoint(x: 93.46, y: 258.35))
        shape.addCurve(to: CGPoint(x: 91.16, y: 261.85), controlPoint1: CGPoint(x: 93.28, y: 259.82), controlPoint2: CGPoint(x: 92.42, y: 261.1))
        shape.addLine(to: CGPoint(x: 83.32, y: 266.44))
        shape.addLine(to: CGPoint(x: 81.62, y: 265.63))
        shape.addCurve(to: CGPoint(x: 79.19, y: 262.25), controlPoint1: CGPoint(x: 80.27, y: 265.01), controlPoint2: CGPoint(x: 79.36, y: 263.72))
        shape.addLine(to: CGPoint(x: 76.62, y: 239.11))
        shape.addCurve(to: CGPoint(x: 75.85, y: 237.11), controlPoint1: CGPoint(x: 76.54, y: 238.36), controlPoint2: CGPoint(x: 76.26, y: 237.68))
        shape.addLine(to: CGPoint(x: 84.08, y: 231.65))
        shape.addCurve(to: CGPoint(x: 89.16, y: 231.55), controlPoint1: CGPoint(x: 85.6, y: 230.63), controlPoint2: CGPoint(x: 87.59, y: 230.6))
        shape.addLine(to: CGPoint(x: 93.69, y: 234.31))
        shape.addCurve(to: CGPoint(x: 95.92, y: 238.96), controlPoint1: CGPoint(x: 95.28, y: 235.29), controlPoint2: CGPoint(x: 96.16, y: 237.1))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 충남() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 172.81, y: 412.34))
        shape.addCurve(to: CGPoint(x: 156.53, y: 415.2), controlPoint1: CGPoint(x: 168.78, y: 416.58), controlPoint2: CGPoint(x: 161.44, y: 418.4))
        shape.addLine(to: CGPoint(x: 146.14, y: 408.4))
        shape.addCurve(to: CGPoint(x: 128.34, y: 405.99), controlPoint1: CGPoint(x: 140.88, y: 404.95), controlPoint2: CGPoint(x: 134.33, y: 404.06))
        shape.addLine(to: CGPoint(x: 82.6, y: 420.74))
        shape.addLine(to: CGPoint(x: 63.09, y: 347.29))
        shape.addCurve(to: CGPoint(x: 58.98, y: 344.12), controlPoint1: CGPoint(x: 62.6, y: 345.43), controlPoint2: CGPoint(x: 60.91, y: 344.12))
        shape.addCurve(to: CGPoint(x: 47.5, y: 342.72), controlPoint1: CGPoint(x: 49.46, y: 344.12), controlPoint2: CGPoint(x: 48.31, y: 343.61))
        shape.addLine(to: CGPoint(x: 34.54, y: 328.35))
        shape.addCurve(to: CGPoint(x: 34.96, y: 322.23), controlPoint1: CGPoint(x: 32.92, y: 326.56), controlPoint2: CGPoint(x: 33.12, y: 323.78))
        shape.addLine(to: CGPoint(x: 61.19, y: 300.38))
        shape.addCurve(to: CGPoint(x: 63.63, y: 299.41), controlPoint1: CGPoint(x: 61.88, y: 299.81), controlPoint2: CGPoint(x: 62.73, y: 299.46))
        shape.addLine(to: CGPoint(x: 82.96, y: 298.16))
        shape.addCurve(to: CGPoint(x: 86.57, y: 295.66), controlPoint1: CGPoint(x: 84.67, y: 298.04), controlPoint2: CGPoint(x: 85.96, y: 297.01))
        shape.addLine(to: CGPoint(x: 119.64, y: 303.98))
        shape.addCurve(to: CGPoint(x: 123.71, y: 306.65), controlPoint1: CGPoint(x: 121.26, y: 304.39), controlPoint2: CGPoint(x: 122.7, y: 305.33))
        shape.addLine(to: CGPoint(x: 128.89, y: 313.4))
        shape.addCurve(to: CGPoint(x: 134.55, y: 316.3), controlPoint1: CGPoint(x: 130.3, y: 315.23), controlPoint2: CGPoint(x: 132.4, y: 316.23))
        shape.addLine(to: CGPoint(x: 144.26, y: 326.85))
        shape.addCurve(to: CGPoint(x: 146.03, y: 334.1), controlPoint1: CGPoint(x: 146.56, y: 328.5), controlPoint2: CGPoint(x: 147.32, y: 331.58))
        shape.addLine(to: CGPoint(x: 143.83, y: 338.44))
        shape.addCurve(to: CGPoint(x: 143.61, y: 343.14), controlPoint1: CGPoint(x: 143.07, y: 339.93), controlPoint2: CGPoint(x: 143.02, y: 341.65))
        shape.addLine(to: CGPoint(x: 138.1, y: 340.36))
        shape.addCurve(to: CGPoint(x: 131.32, y: 345.52), controlPoint1: CGPoint(x: 134.58, y: 338.59), controlPoint2: CGPoint(x: 130.56, y: 341.65))
        shape.addLine(to: CGPoint(x: 134.53, y: 361.66))
        shape.addCurve(to: CGPoint(x: 137.82, y: 365.28), controlPoint1: CGPoint(x: 134.88, y: 363.47), controlPoint2: CGPoint(x: 136.21, y: 364.8))
        shape.addCurve(to: CGPoint(x: 141.69, y: 387.86), controlPoint1: CGPoint(x: 137.82, y: 383.8), controlPoint2: CGPoint(x: 139.29, y: 386.4))
        shape.addLine(to: CGPoint(x: 146.22, y: 390.6))
        shape.addCurve(to: CGPoint(x: 155.45, y: 389.97), controlPoint1: CGPoint(x: 149.12, y: 392.35), controlPoint2: CGPoint(x: 152.81, y: 392.11))
        shape.addLine(to: CGPoint(x: 158.7, y: 387.23))
        shape.addCurve(to: CGPoint(x: 159.34, y: 389.42), controlPoint1: CGPoint(x: 158.76, y: 387.99), controlPoint2: CGPoint(x: 158.97, y: 388.74))
        shape.addLine(to: CGPoint(x: 170.06, y: 409.78))
        shape.addCurve(to: CGPoint(x: 172.81, y: 412.34), controlPoint1: CGPoint(x: 170.68, y: 410.95), controlPoint2: CGPoint(x: 171.66, y: 411.84))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 강원() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 335.6, y: 290.54))
        shape.addLine(to: CGPoint(x: 282.49, y: 293.91))
        shape.addCurve(to: CGPoint(x: 275.29, y: 292.38), controlPoint1: CGPoint(x: 279.99, y: 294.06), controlPoint2: CGPoint(x: 277.51, y: 293.53))
        shape.addLine(to: CGPoint(x: 269.29, y: 289.24))
        shape.addLine(to: CGPoint(x: 237.3, y: 272.55))
        shape.addCurve(to: CGPoint(x: 224.01, y: 272.91), controlPoint1: CGPoint(x: 233.1, y: 270.37), controlPoint2: CGPoint(x: 228.08, y: 270.5))
        shape.addLine(to: CGPoint(x: 203.26, y: 285.17))
        shape.addCurve(to: CGPoint(x: 195.94, y: 287.07), controlPoint1: CGPoint(x: 201.04, y: 286.48), controlPoint2: CGPoint(x: 198.5, y: 287.13))
        shape.addLine(to: CGPoint(x: 175.76, y: 286.99))
        shape.addLine(to: CGPoint(x: 178.06, y: 285.24))
        shape.addCurve(to: CGPoint(x: 180.74, y: 281.2), controlPoint1: CGPoint(x: 179.38, y: 284.23), controlPoint2: CGPoint(x: 180.32, y: 282.81))
        shape.addLine(to: CGPoint(x: 186.42, y: 259.12))
        shape.addCurve(to: CGPoint(x: 179.26, y: 249.88), controlPoint1: CGPoint(x: 187.62, y: 254.44), controlPoint2: CGPoint(x: 184.09, y: 249.88))
        shape.addCurve(to: CGPoint(x: 166.66, y: 244.61), controlPoint1: CGPoint(x: 170.47, y: 249.88), controlPoint2: CGPoint(x: 167.59, y: 247.74))
        shape.addLine(to: CGPoint(x: 162.03, y: 229.25))
        shape.addCurve(to: CGPoint(x: 162.28, y: 224.29), controlPoint1: CGPoint(x: 161.54, y: 227.62), controlPoint2: CGPoint(x: 161.62, y: 225.86))
        shape.addLine(to: CGPoint(x: 169.5, y: 206.81))
        shape.addCurve(to: CGPoint(x: 166.97, y: 197.97), controlPoint1: CGPoint(x: 170.8, y: 203.63), controlPoint2: CGPoint(x: 169.76, y: 199.97))
        shape.addLine(to: CGPoint(x: 122.3, y: 165.87))
        shape.addLine(to: CGPoint(x: 129.44, y: 156.82))
        shape.addCurve(to: CGPoint(x: 132.45, y: 155.21), controlPoint1: CGPoint(x: 130.18, y: 155.89), controlPoint2: CGPoint(x: 131.26, y: 155.31))
        shape.addLine(to: CGPoint(x: 215.32, y: 148.59))
        shape.addCurve(to: CGPoint(x: 218.96, y: 145.87), controlPoint1: CGPoint(x: 216.96, y: 148.47), controlPoint2: CGPoint(x: 218.37, y: 147.4))
        shape.addLine(to: CGPoint(x: 226.12, y: 127.09))
        shape.addCurve(to: CGPoint(x: 233.69, y: 126.34), controlPoint1: CGPoint(x: 227.37, y: 123.8), controlPoint2: CGPoint(x: 231.84, y: 123.36))
        shape.addLine(to: CGPoint(x: 334.95, y: 288.18))
        shape.addCurve(to: CGPoint(x: 335.6, y: 290.54), controlPoint1: CGPoint(x: 335.4, y: 288.89), controlPoint2: CGPoint(x: 335.62, y: 289.71))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 대전() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 163.13, y: 366.06))
        shape.addLine(to: CGPoint(x: 158.98, y: 385.83))
        shape.addCurve(to: CGPoint(x: 158.88, y: 387.47), controlPoint1: CGPoint(x: 158.86, y: 386.37), controlPoint2: CGPoint(x: 158.83, y: 386.93))
        shape.addLine(to: CGPoint(x: 155.63, y: 390.22))
        shape.addCurve(to: CGPoint(x: 146.4, y: 390.84), controlPoint1: CGPoint(x: 152.99, y: 392.36), controlPoint2: CGPoint(x: 149.3, y: 392.6))
        shape.addLine(to: CGPoint(x: 141.87, y: 388.1))
        shape.addCurve(to: CGPoint(x: 138, y: 381.23), controlPoint1: CGPoint(x: 139.47, y: 386.65), controlPoint2: CGPoint(x: 138, y: 384.04))
        shape.addCurve(to: CGPoint(x: 141.21, y: 365.35), controlPoint1: CGPoint(x: 139.01, y: 365.83), controlPoint2: CGPoint(x: 140.14, y: 365.8))
        shape.addLine(to: CGPoint(x: 158.55, y: 358))
        shape.addLine(to: CGPoint(x: 161.45, y: 360.71))
        shape.addCurve(to: CGPoint(x: 163.13, y: 366.06), controlPoint1: CGPoint(x: 162.9, y: 362.08), controlPoint2: CGPoint(x: 163.54, y: 364.1))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 세종() -> CAShapeLayer {
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
        
        return shapeLayer
    }
    
    func 전북() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 193.28, y: 428.07))
        shape.addCurve(to: CGPoint(x: 189.67, y: 429.88), controlPoint1: CGPoint(x: 191.95, y: 428.29), controlPoint2: CGPoint(x: 190.69, y: 428.9))
        shape.addLine(to: CGPoint(x: 174.05, y: 444.88))
        shape.addCurve(to: CGPoint(x: 171.97, y: 449.76), controlPoint1: CGPoint(x: 172.73, y: 446.16), controlPoint2: CGPoint(x: 171.97, y: 447.92))
        shape.addCurve(to: CGPoint(x: 169.08, y: 496.01), controlPoint1: CGPoint(x: 171.97, y: 492.78), controlPoint2: CGPoint(x: 170.83, y: 494.8))
        shape.addCurve(to: CGPoint(x: 164.67, y: 497.22), controlPoint1: CGPoint(x: 167.85, y: 496.88), controlPoint2: CGPoint(x: 166.31, y: 497.35))
        shape.addLine(to: CGPoint(x: 125.21, y: 494.11))
        shape.addCurve(to: CGPoint(x: 118.97, y: 487.36), controlPoint1: CGPoint(x: 121.69, y: 493.82), controlPoint2: CGPoint(x: 118.97, y: 490.88))
        shape.addCurve(to: CGPoint(x: 115.69, y: 475.25), controlPoint1: CGPoint(x: 118.97, y: 478.67), controlPoint2: CGPoint(x: 117.73, y: 476.47))
        shape.addLine(to: CGPoint(x: 102.56, y: 467.37))
        shape.addCurve(to: CGPoint(x: 93.03, y: 470.12), controlPoint1: CGPoint(x: 99.18, y: 465.34), controlPoint2: CGPoint(x: 94.8, y: 466.62))
        shape.addLine(to: CGPoint(x: 85.91, y: 484.25))
        shape.addCurve(to: CGPoint(x: 76.33, y: 486.97), controlPoint1: CGPoint(x: 84.13, y: 487.79), controlPoint2: CGPoint(x: 79.7, y: 489.04))
        shape.addLine(to: CGPoint(x: 62.04, y: 478.2))
        shape.addLine(to: CGPoint(x: 85.18, y: 434.88))
        shape.addCurve(to: CGPoint(x: 85.53, y: 431.78), controlPoint1: CGPoint(x: 85.68, y: 433.93), controlPoint2: CGPoint(x: 85.81, y: 432.82))
        shape.addLine(to: CGPoint(x: 82.6, y: 420.74))
        shape.addLine(to: CGPoint(x: 128.34, y: 405.99))
        shape.addCurve(to: CGPoint(x: 146.14, y: 408.4), controlPoint1: CGPoint(x: 134.33, y: 404.06), controlPoint2: CGPoint(x: 140.88, y: 404.95))
        shape.addLine(to: CGPoint(x: 156.53, y: 415.2))
        shape.addCurve(to: CGPoint(x: 172.81, y: 412.34), controlPoint1: CGPoint(x: 161.44, y: 418.4), controlPoint2: CGPoint(x: 168.78, y: 416.58))
        shape.addCurve(to: CGPoint(x: 176.02, y: 412.76), controlPoint1: CGPoint(x: 173.79, y: 412.78), controlPoint2: CGPoint(x: 174.9, y: 412.94))
        shape.addLine(to: CGPoint(x: 190.1, y: 410.52))
        shape.addLine(to: CGPoint(x: 193.28, y: 428.07))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 경북() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 344.5, y: 414.23))
        shape.addLine(to: CGPoint(x: 335.68, y: 446.18))
        shape.addCurve(to: CGPoint(x: 308.04, y: 448.71), controlPoint1: CGPoint(x: 313.82, y: 446.18), controlPoint2: CGPoint(x: 310.73, y: 447.06))
        shape.addLine(to: CGPoint(x: 293.48, y: 458.48))
        shape.addCurve(to: CGPoint(x: 289.73, y: 457.67), controlPoint1: CGPoint(x: 292.36, y: 457.86), controlPoint2: CGPoint(x: 291.05, y: 457.57))
        shape.addLine(to: CGPoint(x: 251.36, y: 460.53))
        shape.addLine(to: CGPoint(x: 256.02, y: 449.62))
        shape.addCurve(to: CGPoint(x: 260.09, y: 446.51), controlPoint1: CGPoint(x: 256.72, y: 447.92), controlPoint2: CGPoint(x: 258.28, y: 446.74))
        shape.addLine(to: CGPoint(x: 268.68, y: 445.43))
        shape.addCurve(to: CGPoint(x: 273.09, y: 439.68), controlPoint1: CGPoint(x: 271.5, y: 445.08), controlPoint2: CGPoint(x: 273.48, y: 442.5))
        shape.addLine(to: CGPoint(x: 270.53, y: 420.93))
        shape.addCurve(to: CGPoint(x: 262.23, y: 417.69), controlPoint1: CGPoint(x: 269.99, y: 416.97), controlPoint2: CGPoint(x: 265.31, y: 415.14))
        shape.addLine(to: CGPoint(x: 242.35, y: 434.19))
        shape.addCurve(to: CGPoint(x: 240.51, y: 438.12), controlPoint1: CGPoint(x: 241.19, y: 435.17), controlPoint2: CGPoint(x: 240.51, y: 436.6))
        shape.addLine(to: CGPoint(x: 240.75, y: 461.32))
        shape.addLine(to: CGPoint(x: 234.1, y: 461.81))
        shape.addCurve(to: CGPoint(x: 227.05, y: 456.75), controlPoint1: CGPoint(x: 230.84, y: 462.05), controlPoint2: CGPoint(x: 227.87, y: 459.92))
        shape.addLine(to: CGPoint(x: 223.68, y: 443.7))
        shape.addCurve(to: CGPoint(x: 219.99, y: 439.26), controlPoint1: CGPoint(x: 223.18, y: 441.74), controlPoint2: CGPoint(x: 221.82, y: 440.11))
        shape.addLine(to: CGPoint(x: 197.23, y: 428.62))
        shape.addCurve(to: CGPoint(x: 193.28, y: 428.07), controlPoint1: CGPoint(x: 195.97, y: 428.03), controlPoint2: CGPoint(x: 194.59, y: 427.86))
        shape.addLine(to: CGPoint(x: 190.1, y: 410.52))
        shape.addLine(to: CGPoint(x: 198.92, y: 409.12))
        shape.addCurve(to: CGPoint(x: 203.58, y: 404.86), controlPoint1: CGPoint(x: 201.19, y: 408.76), controlPoint2: CGPoint(x: 203.02, y: 407.08))
        shape.addLine(to: CGPoint(x: 207.51, y: 389.12))
        shape.addCurve(to: CGPoint(x: 204.15, y: 382.46), controlPoint1: CGPoint(x: 208.19, y: 386.38), controlPoint2: CGPoint(x: 206.77, y: 383.54))
        shape.addLine(to: CGPoint(x: 198.07, y: 379.92))
        shape.addCurve(to: CGPoint(x: 194.88, y: 372.7), controlPoint1: CGPoint(x: 195.25, y: 378.76), controlPoint2: CGPoint(x: 193.84, y: 375.57))
        shape.addLine(to: CGPoint(x: 202.56, y: 351.46))
        shape.addCurve(to: CGPoint(x: 202.36, y: 347.1), controlPoint1: CGPoint(x: 203.07, y: 350.04), controlPoint2: CGPoint(x: 203, y: 348.47))
        shape.addLine(to: CGPoint(x: 200.84, y: 343.86))
        shape.addCurve(to: CGPoint(x: 203.5, y: 336.31), controlPoint1: CGPoint(x: 199.52, y: 341.04), controlPoint2: CGPoint(x: 200.71, y: 337.69))
        shape.addLine(to: CGPoint(x: 244.23, y: 316.24))
        shape.addCurve(to: CGPoint(x: 245.93, y: 314.96), controlPoint1: CGPoint(x: 244.87, y: 315.92), controlPoint2: CGPoint(x: 245.45, y: 315.5))
        shape.addLine(to: CGPoint(x: 269.29, y: 289.24))
        shape.addLine(to: CGPoint(x: 275.29, y: 292.38))
        shape.addCurve(to: CGPoint(x: 282.49, y: 293.91), controlPoint1: CGPoint(x: 277.51, y: 293.53), controlPoint2: CGPoint(x: 279.99, y: 294.06))
        shape.addLine(to: CGPoint(x: 335.6, y: 290.54))
        shape.addLine(to: CGPoint(x: 332.98, y: 405.1))
        shape.addCurve(to: CGPoint(x: 337.23, y: 409.46), controlPoint1: CGPoint(x: 332.93, y: 407.6), controlPoint2: CGPoint(x: 334.96, y: 409.46))
        shape.addCurve(to: CGPoint(x: 338.82, y: 409.15), controlPoint1: CGPoint(x: 337.75, y: 409.46), controlPoint2: CGPoint(x: 338.29, y: 409.36))
        shape.addCurve(to: CGPoint(x: 344.5, y: 414.23), controlPoint1: CGPoint(x: 342.09, y: 407.84), controlPoint2: CGPoint(x: 345.44, y: 410.85))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 경남() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 314.85, y: 478.24))
        shape.addLine(to: CGPoint(x: 288.38, y: 501.03))
        shape.addCurve(to: CGPoint(x: 285.4, y: 506.96), controlPoint1: CGPoint(x: 286.63, y: 502.53), controlPoint2: CGPoint(x: 285.56, y: 504.67))
        shape.addLine(to: CGPoint(x: 284.19, y: 524.32))
        shape.addLine(to: CGPoint(x: 255.84, y: 515.39))
        shape.addCurve(to: CGPoint(x: 250.78, y: 517.51), controlPoint1: CGPoint(x: 253.86, y: 514.76), controlPoint2: CGPoint(x: 251.71, y: 515.66))
        shape.addLine(to: CGPoint(x: 241.63, y: 535.43))
        shape.addCurve(to: CGPoint(x: 237.44, y: 537.73), controlPoint1: CGPoint(x: 240.84, y: 536.99), controlPoint2: CGPoint(x: 239.18, y: 537.9))
        shape.addLine(to: CGPoint(x: 215.34, y: 535.6))
        shape.addCurve(to: CGPoint(x: 211.5, y: 531.36), controlPoint1: CGPoint(x: 213.15, y: 535.38), controlPoint2: CGPoint(x: 211.5, y: 533.55))
        shape.addCurve(to: CGPoint(x: 205.81, y: 527.02), controlPoint1: CGPoint(x: 211.5, y: 528.09), controlPoint2: CGPoint(x: 208.58, y: 526.04))
        shape.addLine(to: CGPoint(x: 189.04, y: 533))
        shape.addLine(to: CGPoint(x: 174.87, y: 520.57))
        shape.addCurve(to: CGPoint(x: 171.47, y: 514.2), controlPoint1: CGPoint(x: 173, y: 518.93), controlPoint2: CGPoint(x: 171.8, y: 516.66))
        shape.addLine(to: CGPoint(x: 169.08, y: 496.02))
        shape.addCurve(to: CGPoint(x: 171.97, y: 490.47), controlPoint1: CGPoint(x: 170.83, y: 494.8), controlPoint2: CGPoint(x: 171.97, y: 492.78))
        shape.addCurve(to: CGPoint(x: 174.05, y: 444.88), controlPoint1: CGPoint(x: 171.97, y: 447.92), controlPoint2: CGPoint(x: 172.73, y: 446.16))
        shape.addLine(to: CGPoint(x: 189.67, y: 429.88))
        shape.addCurve(to: CGPoint(x: 193.28, y: 428.07), controlPoint1: CGPoint(x: 190.69, y: 428.9), controlPoint2: CGPoint(x: 191.95, y: 428.29))
        shape.addCurve(to: CGPoint(x: 197.23, y: 428.62), controlPoint1: CGPoint(x: 194.59, y: 427.86), controlPoint2: CGPoint(x: 195.97, y: 428.03))
        shape.addLine(to: CGPoint(x: 219.99, y: 439.26))
        shape.addCurve(to: CGPoint(x: 223.68, y: 443.7), controlPoint1: CGPoint(x: 221.82, y: 440.11), controlPoint2: CGPoint(x: 223.18, y: 441.74))
        shape.addLine(to: CGPoint(x: 227.05, y: 456.75))
        shape.addCurve(to: CGPoint(x: 234.1, y: 461.81), controlPoint1: CGPoint(x: 227.87, y: 459.92), controlPoint2: CGPoint(x: 230.84, y: 462.05))
        shape.addLine(to: CGPoint(x: 240.75, y: 461.32))
        shape.addLine(to: CGPoint(x: 251.36, y: 460.53))
        shape.addLine(to: CGPoint(x: 289.73, y: 457.67))
        shape.addCurve(to: CGPoint(x: 293.48, y: 458.48), controlPoint1: CGPoint(x: 291.06, y: 457.57), controlPoint2: CGPoint(x: 292.36, y: 457.86))
        shape.addCurve(to: CGPoint(x: 296.13, y: 461.09), controlPoint1: CGPoint(x: 294.57, y: 459.07), controlPoint2: CGPoint(x: 295.49, y: 459.97))
        shape.addLine(to: CGPoint(x: 299.5, y: 467.09))
        shape.addCurve(to: CGPoint(x: 301.63, y: 469.4), controlPoint1: CGPoint(x: 300.02, y: 468.02), controlPoint2: CGPoint(x: 300.75, y: 468.81))
        shape.addLine(to: CGPoint(x: 314.85, y: 478.24))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 전남() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 174.87, y: 520.57))
        shape.addCurve(to: CGPoint(x: 171.47, y: 514.2), controlPoint1: CGPoint(x: 173, y: 518.93), controlPoint2: CGPoint(x: 171.8, y: 516.66))
        shape.addLine(to: CGPoint(x: 169.08, y: 496.02))
        shape.addCurve(to: CGPoint(x: 164.67, y: 497.22), controlPoint1: CGPoint(x: 167.85, y: 496.88), controlPoint2: CGPoint(x: 166.31, y: 497.35))
        shape.addLine(to: CGPoint(x: 125.21, y: 494.11))
        shape.addCurve(to: CGPoint(x: 118.97, y: 487.36), controlPoint1: CGPoint(x: 121.69, y: 493.82), controlPoint2: CGPoint(x: 118.97, y: 490.88))
        shape.addCurve(to: CGPoint(x: 115.69, y: 475.25), controlPoint1: CGPoint(x: 118.97, y: 478.67), controlPoint2: CGPoint(x: 117.73, y: 476.47))
        shape.addLine(to: CGPoint(x: 102.56, y: 467.37))
        shape.addCurve(to: CGPoint(x: 93.03, y: 470.12), controlPoint1: CGPoint(x: 99.18, y: 465.34), controlPoint2: CGPoint(x: 94.8, y: 466.62))
        shape.addLine(to: CGPoint(x: 85.91, y: 484.24))
        shape.addCurve(to: CGPoint(x: 76.33, y: 486.97), controlPoint1: CGPoint(x: 84.13, y: 487.79), controlPoint2: CGPoint(x: 79.7, y: 489.04))
        shape.addLine(to: CGPoint(x: 62.04, y: 478.2))
        shape.addLine(to: CGPoint(x: 36.07, y: 526.85))
        shape.addCurve(to: CGPoint(x: 36.36, y: 531.33), controlPoint1: CGPoint(x: 35.3, y: 528.28), controlPoint2: CGPoint(x: 35.42, y: 530.01))
        shape.addLine(to: CGPoint(x: 47.5, y: 546.92))
        shape.addCurve(to: CGPoint(x: 48.06, y: 550.78), controlPoint1: CGPoint(x: 48.29, y: 548.04), controlPoint2: CGPoint(x: 48.5, y: 549.48))
        shape.addLine(to: CGPoint(x: 43.74, y: 563.4))
        shape.addCurve(to: CGPoint(x: 45.27, y: 568.22), controlPoint1: CGPoint(x: 43.14, y: 565.16), controlPoint2: CGPoint(x: 43.76, y: 567.12))
        shape.addLine(to: CGPoint(x: 60.03, y: 578.92))
        shape.addCurve(to: CGPoint(x: 61.68, y: 581.42), controlPoint1: CGPoint(x: 60.87, y: 579.52), controlPoint2: CGPoint(x: 61.45, y: 580.42))
        shape.addLine(to: CGPoint(x: 65.4, y: 597.68))
        shape.addCurve(to: CGPoint(x: 70.84, y: 600.78), controlPoint1: CGPoint(x: 65.96, y: 600.1), controlPoint2: CGPoint(x: 68.47, y: 601.53))
        shape.addLine(to: CGPoint(x: 109.7, y: 588.49))
        shape.addCurve(to: CGPoint(x: 112.56, y: 585.4), controlPoint1: CGPoint(x: 111.13, y: 588.04), controlPoint2: CGPoint(x: 112.21, y: 586.87))
        shape.addLine(to: CGPoint(x: 118.45, y: 560.26))
        shape.addCurve(to: CGPoint(x: 121.16, y: 557.22), controlPoint1: CGPoint(x: 118.77, y: 558.85), controlPoint2: CGPoint(x: 119.79, y: 557.72))
        shape.addLine(to: CGPoint(x: 189.04, y: 533))
        shape.addLine(to: CGPoint(x: 174.87, y: 520.57))
        shape.close()
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
        shape.addCurve(to: CGPoint(x: 115.83, y: 505.83), controlPoint1: CGPoint(x: 115.32, y: 505.02), controlPoint2: CGPoint(x: 115.61, y: 505.41))
        shape.addLine(to: CGPoint(x: 117.27, y: 508.46))
        shape.addCurve(to: CGPoint(x: 113.44, y: 517.49), controlPoint1: CGPoint(x: 119.2, y: 512), controlPoint2: CGPoint(x: 117.33, y: 516.42))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 부산() -> CAShapeLayer {
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
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 울산() -> CAShapeLayer {
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
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 영종도() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 68.35, y: 252.12))
        shape.addLine(to: CGPoint(x: 61.8, y: 255.51))
        shape.addCurve(to: CGPoint(x: 57.92, y: 254.6), controlPoint1: CGPoint(x: 60.45, y: 256.2), controlPoint2: CGPoint(x: 58.81, y: 255.82))
        shape.addLine(to: CGPoint(x: 54.68, y: 250.13))
        shape.addCurve(to: CGPoint(x: 56.39, y: 245.38), controlPoint1: CGPoint(x: 53.4, y: 248.38), controlPoint2: CGPoint(x: 54.29, y: 245.9))
        shape.addLine(to: CGPoint(x: 61.77, y: 244))
        shape.addCurve(to: CGPoint(x: 64.01, y: 244.29), controlPoint1: CGPoint(x: 62.52, y: 243.81), controlPoint2: CGPoint(x: 63.33, y: 243.91))
        shape.addLine(to: CGPoint(x: 68.42, y: 246.74))
        shape.addCurve(to: CGPoint(x: 68.35, y: 252.12), controlPoint1: CGPoint(x: 70.56, y: 247.93), controlPoint2: CGPoint(x: 70.51, y: 251))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 제주() -> CAShapeLayer {
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
        
        return shapeLayer
    }
    
    func 고흥() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 156.99, y: 575.31))
        shape.addLine(to: CGPoint(x: 145.74, y: 584.13))
        shape.addCurve(to: CGPoint(x: 142.13, y: 584.63), controlPoint1: CGPoint(x: 144.71, y: 584.94), controlPoint2: CGPoint(x: 143.33, y: 585.13))
        shape.addLine(to: CGPoint(x: 127.63, y: 578.63))
        shape.addCurve(to: CGPoint(x: 125.86, y: 573.5), controlPoint1: CGPoint(x: 125.62, y: 577.8), controlPoint2: CGPoint(x: 124.79, y: 575.4))
        shape.addLine(to: CGPoint(x: 132.19, y: 562.26))
        shape.addCurve(to: CGPoint(x: 135.1, y: 560.43), controlPoint1: CGPoint(x: 132.79, y: 561.2), controlPoint2: CGPoint(x: 133.89, y: 560.51))
        shape.addLine(to: CGPoint(x: 150.36, y: 559.35))
        shape.addCurve(to: CGPoint(x: 153.94, y: 561.51), controlPoint1: CGPoint(x: 151.89, y: 559.24), controlPoint2: CGPoint(x: 153.33, y: 560.11))
        shape.addLine(to: CGPoint(x: 158.07, y: 571.02))
        shape.addCurve(to: CGPoint(x: 156.99, y: 575.31), controlPoint1: CGPoint(x: 158.73, y: 572.53), controlPoint2: CGPoint(x: 158.28, y: 574.3))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 진도() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 51.95, y: 586.78))
        shape.addLine(to: CGPoint(x: 50.35, y: 593.26))
        shape.addCurve(to: CGPoint(x: 45.81, y: 597.18), controlPoint1: CGPoint(x: 49.82, y: 595.39), controlPoint2: CGPoint(x: 48, y: 596.97))
        shape.addLine(to: CGPoint(x: 35.43, y: 598.18))
        shape.addCurve(to: CGPoint(x: 30.76, y: 596.11), controlPoint1: CGPoint(x: 33.62, y: 598.35), controlPoint2: CGPoint(x: 31.84, y: 597.56))
        shape.addLine(to: CGPoint(x: 30.37, y: 595.58))
        shape.addCurve(to: CGPoint(x: 30.66, y: 589.02), controlPoint1: CGPoint(x: 28.9, y: 593.6), controlPoint2: CGPoint(x: 29.02, y: 590.86))
        shape.addLine(to: CGPoint(x: 39.54, y: 579.04))
        shape.addCurve(to: CGPoint(x: 46.84, y: 578.58), controlPoint1: CGPoint(x: 41.44, y: 576.92), controlPoint2: CGPoint(x: 44.69, y: 576.71))
        shape.addLine(to: CGPoint(x: 50.32, y: 581.61))
        shape.addCurve(to: CGPoint(x: 51.95, y: 586.78), controlPoint1: CGPoint(x: 51.79, y: 582.89), controlPoint2: CGPoint(x: 52.43, y: 584.89))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 충북() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 269.29, y: 289.24))
        shape.addLine(to: CGPoint(x: 245.93, y: 314.96))
        shape.addCurve(to: CGPoint(x: 244.23, y: 316.24), controlPoint1: CGPoint(x: 245.45, y: 315.49), controlPoint2: CGPoint(x: 244.87, y: 315.92))
        shape.addLine(to: CGPoint(x: 203.5, y: 336.31))
        shape.addCurve(to: CGPoint(x: 200.84, y: 343.86), controlPoint1: CGPoint(x: 200.71, y: 337.68), controlPoint2: CGPoint(x: 199.52, y: 341.04))
        shape.addLine(to: CGPoint(x: 202.36, y: 347.1))
        shape.addCurve(to: CGPoint(x: 202.56, y: 351.46), controlPoint1: CGPoint(x: 203, y: 348.47), controlPoint2: CGPoint(x: 203.07, y: 350.04))
        shape.addLine(to: CGPoint(x: 194.88, y: 372.7))
        shape.addCurve(to: CGPoint(x: 198.07, y: 379.92), controlPoint1: CGPoint(x: 193.84, y: 375.57), controlPoint2: CGPoint(x: 195.25, y: 378.76))
        shape.addLine(to: CGPoint(x: 204.15, y: 382.46))
        shape.addCurve(to: CGPoint(x: 207.51, y: 389.12), controlPoint1: CGPoint(x: 206.77, y: 383.54), controlPoint2: CGPoint(x: 208.19, y: 386.38))
        shape.addLine(to: CGPoint(x: 203.58, y: 404.85))
        shape.addCurve(to: CGPoint(x: 198.92, y: 409.12), controlPoint1: CGPoint(x: 203.02, y: 407.08), controlPoint2: CGPoint(x: 201.19, y: 408.76))
        shape.addLine(to: CGPoint(x: 190.1, y: 410.52))
        shape.addLine(to: CGPoint(x: 176.03, y: 412.76))
        shape.addCurve(to: CGPoint(x: 172.81, y: 412.34), controlPoint1: CGPoint(x: 174.91, y: 412.94), controlPoint2: CGPoint(x: 173.79, y: 412.78))
        shape.addCurve(to: CGPoint(x: 170.06, y: 409.78), controlPoint1: CGPoint(x: 171.66, y: 411.84), controlPoint2: CGPoint(x: 170.68, y: 410.95))
        shape.addLine(to: CGPoint(x: 159.34, y: 389.42))
        shape.addCurve(to: CGPoint(x: 158.7, y: 387.23), controlPoint1: CGPoint(x: 158.97, y: 388.74), controlPoint2: CGPoint(x: 158.76, y: 387.99))
        shape.addCurve(to: CGPoint(x: 158.8, y: 385.58), controlPoint1: CGPoint(x: 158.65, y: 386.68), controlPoint2: CGPoint(x: 158.68, y: 386.13))
        shape.addLine(to: CGPoint(x: 162.95, y: 365.81))
        shape.addCurve(to: CGPoint(x: 161.27, y: 360.47), controlPoint1: CGPoint(x: 163.36, y: 363.85), controlPoint2: CGPoint(x: 162.72, y: 361.83))
        shape.addLine(to: CGPoint(x: 158.37, y: 357.75))
        shape.addLine(to: CGPoint(x: 145.01, y: 345.21))
        shape.addCurve(to: CGPoint(x: 143.61, y: 343.14), controlPoint1: CGPoint(x: 144.39, y: 344.61), controlPoint2: CGPoint(x: 143.91, y: 343.9))
        shape.addCurve(to: CGPoint(x: 143.83, y: 338.44), controlPoint1: CGPoint(x: 143.02, y: 341.65), controlPoint2: CGPoint(x: 143.07, y: 339.93))
        shape.addLine(to: CGPoint(x: 146.03, y: 334.1))
        shape.addCurve(to: CGPoint(x: 144.26, y: 326.85), controlPoint1: CGPoint(x: 147.32, y: 331.57), controlPoint2: CGPoint(x: 146.56, y: 328.5))
        shape.addLine(to: CGPoint(x: 134.55, y: 316.3))
        shape.addCurve(to: CGPoint(x: 139.24, y: 314.78), controlPoint1: CGPoint(x: 136.18, y: 316.34), controlPoint2: CGPoint(x: 137.84, y: 315.85))
        shape.addLine(to: CGPoint(x: 175.76, y: 286.99))
        shape.addLine(to: CGPoint(x: 195.94, y: 287.07))
        shape.addCurve(to: CGPoint(x: 203.26, y: 285.16), controlPoint1: CGPoint(x: 198.5, y: 287.13), controlPoint2: CGPoint(x: 201.05, y: 286.48))
        shape.addLine(to: CGPoint(x: 224.01, y: 272.91))
        shape.addCurve(to: CGPoint(x: 237.3, y: 272.55), controlPoint1: CGPoint(x: 228.08, y: 270.5), controlPoint2: CGPoint(x: 233.1, y: 270.37))
        shape.addLine(to: CGPoint(x: 269.29, y: 289.24))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 대구() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 268.68, y: 445.43))
        shape.addLine(to: CGPoint(x: 260.09, y: 446.51))
        shape.addCurve(to: CGPoint(x: 256.02, y: 449.62), controlPoint1: CGPoint(x: 258.28, y: 446.74), controlPoint2: CGPoint(x: 256.72, y: 447.92))
        shape.addLine(to: CGPoint(x: 251.36, y: 460.53))
        shape.addLine(to: CGPoint(x: 240.75, y: 461.32))
        shape.addLine(to: CGPoint(x: 240.51, y: 438.12))
        shape.addCurve(to: CGPoint(x: 242.35, y: 434.19), controlPoint1: CGPoint(x: 240.51, y: 436.6), controlPoint2: CGPoint(x: 241.19, y: 435.17))
        shape.addLine(to: CGPoint(x: 262.23, y: 417.69))
        shape.addCurve(to: CGPoint(x: 270.53, y: 420.93), controlPoint1: CGPoint(x: 265.31, y: 415.14), controlPoint2: CGPoint(x: 269.99, y: 416.97))
        shape.addLine(to: CGPoint(x: 273.09, y: 439.68))
        shape.addCurve(to: CGPoint(x: 268.68, y: 445.43), controlPoint1: CGPoint(x: 273.48, y: 442.5), controlPoint2: CGPoint(x: 271.5, y: 445.08))
        shape.close()
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 광주() -> CAShapeLayer {
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
        shape.stroke()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = shape.cgPath
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.blue.cgColor
        shapeLayer.lineWidth = 2.0
        
        return shapeLayer
    }
    
    func 서울() -> CAShapeLayer {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 134.87, y: 246.61))
        shape.addLine(to: CGPoint(x: 127.21, y: 253.67))
        shape.addCurve(to: CGPoint(x: 123.27, y: 254.08), controlPoint1: CGPoint(x: 126.13, y: 254.66), controlPoint2: CGPoint(x: 124.53, y: 254.83))
        shape.addLine(to: CGPoint(x: 117.82, y: 250.85))
        shape.addCurve(to: CGPoint(x: 114.52, y: 250.8), controlPoint1: CGPoint(x: 116.81, y: 250.25), controlPoint2: CGPoint(x: 115.55, y: 250.23))
        shape.addLine(to: CGPoint(x: 110.09, y: 253.25))
        shape.addCurve(to: CGPoint(x: 105.27, y: 251.17), controlPoint1: CGPoint(x: 108.19, y: 254.31), controlPoint2: CGPoint(x: 105.8, y: 253.28))
        shape.addLine(to: CGPoint(x: 102.61, y: 240.74))
        shape.addCurve(to: CGPoint(x: 104.88, y: 236.74), controlPoint1: CGPoint(x: 102.18, y: 239.01), controlPoint2: CGPoint(x: 103.18, y: 237.25))
        shape.addCurve(to: CGPoint(x: 106.33, y: 235.85), controlPoint1: CGPoint(x: 105.44, y: 236.58), controlPoint2: CGPoint(x: 105.94, y: 236.27))
        shape.addLine(to: CGPoint(x: 114.74, y: 227.05))
        shape.addCurve(to: CGPoint(x: 117.14, y: 226.03), controlPoint1: CGPoint(x: 115.37, y: 226.4), controlPoint2: CGPoint(x: 116.23, y: 226.03))
        shape.addCurve(to: CGPoint(x: 129.44, y: 229.35), controlPoint1: CGPoint(x: 127.95, y: 226.03), controlPoint2: CGPoint(x: 129.44, y: 227.51))
        shape.addLine(to: CGPoint(x: 134.61, y: 241.51))
        shape.addCurve(to: CGPoint(x: 134.87, y: 246.61), controlPoint1: CGPoint(x: 136.27, y: 242.75), controlPoint2: CGPoint(x: 136.4, y: 245.2))
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

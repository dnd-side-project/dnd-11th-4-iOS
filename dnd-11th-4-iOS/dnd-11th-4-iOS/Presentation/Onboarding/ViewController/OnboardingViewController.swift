//
//  OnboardingViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit
import SnapKit

final class OnboardingViewController: UIViewController {
    
    private let mapContainerView = UIView()
    
    private let 경기도 = OnboardingMap_경기도()
    private let 인천 = OnboardingMap_인천()
    private let 충청남도 = OnboardingMap_충청남도()
    private let 강원도 = OnboardingMap_강원도()
    private let 대전 = OnboardingMap_대전()
    private let 전라북도 = OnboardingMap_전라북도()
    private let 경상북도 = OnboardingMap_경상북도()
    private let 경상남도 = OnboardingMap_경상남도()
    private let 전라남도 = OnboardingMap_전라남도()
    private let 부산 = OnboardingMap_부산()
    private let 울산 = OnboardingMap_울산()
    private let 제주도 = OnboardingMap_제주도()
    private let 충청북도 = OnboardingMap_충청북도()
    private let 대구 = OnboardingMap_대구()
    private let 광주 = OnboardingMap_광주()
    private let 서울 = OnboardingMap_서울()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setLayout()
    }
    
    func setLayout() {
        view.addSubview(mapContainerView)
        mapContainerView.addSubviews(경기도, 인천, 충청남도, 강원도, 대전, 전라북도, 경상북도,
                                     경상남도, 전라남도, 부산, 울산, 제주도, 충청북도, 대구, 광주, 서울)
        기기대응메서드()
    }
    
    func 기기대응메서드() {
        // 13 mini 기준
        if Constant.Screen.width == 375 {
            mapContainerView.frame = CGRect(x: -5, y: 0, width: Constant.Screen.width, height: Constant.Screen.height)
        // 15 pro max 기준
        } else if Constant.Screen.width == 430 {
            mapContainerView.frame = CGRect(x: 25, y: 50, width: Constant.Screen.width, height: Constant.Screen.height)
        }
    }
}

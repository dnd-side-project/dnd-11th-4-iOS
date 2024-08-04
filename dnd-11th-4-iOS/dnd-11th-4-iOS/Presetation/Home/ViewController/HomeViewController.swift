//
//  HomeViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/18/24.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {
    
    private let homeScrollView: UIScrollView = {
        let scrollerView = UIScrollView(frame: CGRect(x: 0, y: 0,
                                                              width: Constant.Screen.width, height: Constant.Screen.height))
        scrollerView.contentSize = CGSize(width: Constant.Screen.width, height: Constant.Screen.height)
        scrollerView.backgroundColor = .mapBackground
        return scrollerView
    }()
    
    private let mapContainerView = UIView()
    
    private let 서울 = HomeMap_서울()
    private let 경기도 = HomeMap_경기도()
    private let 인천 = HomeMap_인천()
    private let 강원도 = HomeMap_강원도()
    private let 충청북도 = HomeMap_충청북도()
    private let 충청남도 = HomeMap_충청남도()
    private let 대전 = HomeMap_대전()
    private let 경상북도 = HomeMap_경상북도()
    private let 경상남도 = HomeMap_경상남도()
    private let 대구 = HomeMap_대구()
    private let 울산 = HomeMap_울산()
    private let 부산 = HomeMap_부산()
    private let 전라북도 = HomeMap_전라북도()
    private let 전라남도 = HomeMap_전라남도()
    private let 광주 = HomeMap_광주()
    private let 제주도 = HomeMap_제주도()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
    }
    
    func setLayout() {
        view.addSubview(homeScrollView)
        homeScrollView.addSubview(mapContainerView)
        mapContainerView.addSubviews(서울, 경기도, 인천, 강원도, 충청북도, 충청남도,
                                     대전, 경상북도, 경상남도, 대구, 울산, 부산, 전라북도,
                                     전라남도, 광주, 제주도)
        기기대응메서드()
    }
    
    func 기기대응메서드() {
        // 13 mini 기준
        if Constant.Screen.width == 375 {
            mapContainerView.frame = CGRect(x: 0, y: -50, width: Constant.Screen.width, height: Constant.Screen.height)
        // 15 pro max 기준
        } else if Constant.Screen.width == 430 {
            mapContainerView.frame = CGRect(x: 25, y: 50, width: Constant.Screen.width, height: Constant.Screen.height)
        }
    }
}

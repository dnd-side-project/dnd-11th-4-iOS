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
        scrollerView.backgroundColor = .white
        return scrollerView
    }()
    
    private let mapContainerView = UIView()
    
    private let 서울 = map_서울()
    private let 경기도 = map_경기도()
    private let 인천 = map_인천()
    private let 강원도 = map_강원도()
    private let 충청북도 = map_충청북도()
    private let 충청남도 = map_충청남도()
    private let 대전 = map_대전()
    private let 경상북도 = map_경상북도()
    private let 경상남도 = map_경상남도()
    private let 대구 = map_대구()
    private let 울산 = map_울산()
    private let 부산 = map_부산()
    private let 전라북도 = map_전라북도()
    private let 전라남도 = map_전라남도()
    private let 광주 = map_광주()
    private let 제주도 = map_제주도()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
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
            mapContainerView.frame = CGRect(x: 0, y: 0, width: Constant.Screen.width, height: Constant.Screen.height)
        // 15 pro max 기준
        } else if Constant.Screen.width == 430 {
            mapContainerView.frame = CGRect(x: 25, y: 50, width: Constant.Screen.width, height: Constant.Screen.height)
        }
    }
}

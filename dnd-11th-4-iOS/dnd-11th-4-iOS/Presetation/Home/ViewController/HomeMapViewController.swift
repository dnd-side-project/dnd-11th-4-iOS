//
//  HomeMapViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/18/24.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import RxGesture
import ReactorKit

final class HomeMapViewController: UIViewController, View {
    
    typealias Reactor = HomeMapReactor
    
    var disposeBag = DisposeBag()
    
    private let homeScrollView: UIScrollView = {
        let scrollerView = UIScrollView(frame: CGRect(x: 0, y: 0,
                                                      width: Constant.Screen.width, height: Constant.Screen.height))
        scrollerView.backgroundColor = .mapBackground
        scrollerView.isScrollEnabled = true
        scrollerView.minimumZoomScale = 1.0
        scrollerView.maximumZoomScale = 6.0
        scrollerView.showsVerticalScrollIndicator = false
        scrollerView.showsHorizontalScrollIndicator = false
        return scrollerView
    }()
    
    private let recordButton = MDButton(backgroundColor: .black2)
        .setText(attributedString: NSAttributedString.pretendardB1("서울에 기록 추가하기"),
                 color: .mapWhite)
    
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
    
    private let data = [DummyModel(name: "서울", opacity: 1, blue: .blue),
                        DummyModel(name: "경기도", opacity: 1, blue: .yellow),
                        DummyModel(name: "인천", opacity: 1, blue: .blue),
                        DummyModel(name: "강원도", opacity: 1, blue: .yellow),
                        DummyModel(name: "충청북도", opacity: 1, blue: .blue),
                        DummyModel(name: "충청남도", opacity: 1, blue: .yellow),
                        DummyModel(name: "대전", opacity: 1, blue: .blue),
                        DummyModel(name: "경상북도", opacity: 1, blue: .yellow),
                        DummyModel(name: "경상남도", opacity: 1, blue: .blue),
                        DummyModel(name: "대구", opacity: 1, blue: .yellow),
                        DummyModel(name: "울산", opacity: 1, blue: .blue),
                        DummyModel(name: "부산", opacity: 1, blue: .yellow),
                        DummyModel(name: "전라북도", opacity: 1, blue: .blue),
                        DummyModel(name: "전라남도", opacity: 1, blue: .yellow),
                        DummyModel(name: "광주", opacity: 1, blue: .blue),
                        DummyModel(name: "제주도", opacity: 1, blue: .yellow)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setDelegate()
        // 첫 진입시 button hidden 처리
        recordButton.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reactor?.action.onNext(.서울Action(data))
    }
    
    init(reactor: HomeMapReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(reactor: HomeMapReactor) {
        서울.rx.tapGesture()
            .when(.recognized)
            .map { _ in Reactor.Action.서울Action(self.data) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
//        reactor.state.map { $0.initMapViewColor }
//            .withUnretained(self)
//            .subscribe { _, models in
//                for model in models {
//                    switch model.mapName {
//                    case "서울":
//                        self.서울.bindMapUI(color: model.mapColor)
//                    case "경기도":
//                        self.경기도.bindMapUI(color: .errorRed)
//                    case "인천":
//                        self.인천.bindMapUI(color: model.mapColor)
//                    case "강원도":
//                        self.강원도.bindMapUI(color: model.mapColor)
//                    case "충청북도":
//                        self.충청북도.bindMapUI(color: model.mapColor)
//                    case "충청남도":
//                        self.충청남도.bindMapUI(color: model.mapColor)
//                    case "대전":
//                        self.대전.bindMapUI(color: .green)
//                    case "경상북도":
//                        self.경상북도.bindMapUI(color: model.mapColor)
//                    case "경상남도":
//                        self.경상남도.bindMapUI(color: model.mapColor)
//                    case "대구":
//                        self.대구.bindMapUI(color: model.mapColor)
//                    case "울산":
//                        self.울산.bindMapUI(color: model.mapColor)
//                    case "부산":
//                        self.부산.bindMapUI(color: model.mapColor)
//                    case "전라북도":
//                        self.부산.bindMapUI(color: model.mapColor)
//                    case "전라남도":
//                        self.부산.bindMapUI(color: model.mapColor)
//                    case "광주":
//                        self.부산.bindMapUI(color: model.mapColor)
//                    case "제주도":
//                        self.부산.bindMapUI(color: model.mapColor)
//                    default: break
//                    }
//                }
//            }
//            .disposed(by: disposeBag)
    }
    
    private func setLayout() {
        view.addSubviews(homeScrollView, recordButton)
        homeScrollView.addSubviews(mapContainerView)
        mapContainerView.addSubviews(서울, 경기도, 인천, 강원도, 충청북도, 충청남도,
                                     대전, 경상북도, 경상남도, 대구, 울산, 부산, 전라북도,
                                     전라남도, 광주, 제주도)
        
        recordButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(11)
            make.height.equalTo(52)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
        }
        
        기기대응메서드()
    }
    
    private func setDelegate() {
        homeScrollView.delegate = self
    }
    
    func 기기대응메서드() {
        // TabBar 높이 + 이동한 거리 50 = 145
        // 13 mini 기준
        if Constant.Screen.width == 375 {
            mapContainerView.frame = CGRect(x: 0, y: -50, width: Constant.Screen.width, height: Constant.Screen.height-145)
            // 15 pro max 기준
        } else if Constant.Screen.width == 430 {
            mapContainerView.frame = CGRect(x: 25, y: 50, width: Constant.Screen.width, height: Constant.Screen.height)
        }
    }
}

extension HomeMapViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return mapContainerView
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.zoomScale <= 1.0 {
            scrollView.zoomScale = 1.0
        }
    }
}

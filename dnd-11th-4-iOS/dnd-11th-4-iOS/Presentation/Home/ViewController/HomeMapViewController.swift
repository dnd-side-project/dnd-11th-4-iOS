//
//  HomeMapViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/18/24.
//

import UIKit
import SnapKit
import RxGesture
import ReactorKit

final class HomeMapViewController: UIViewController, View {
    
    typealias Reactor = HomeMapReactor
    var disposeBag = DisposeBag()
    
    // MARK: - UI Properties
    
    private let homeScrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.backgroundColor = .mapBackground
        scrollView.isScrollEnabled = true
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let recordButton = MDButton(backgroundColor: .black2)
    private let mapContainerView = UIView()
    
    private let visitedMapCountView: UIView = {
        let view = UIView()
        view.backgroundColor = .mapWhite
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor.gray60.cgColor
        view.layer.borderWidth = 1.0
        return view
    }()
    private let shoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.iconShoes
        return imageView
    }()
    
    private let mapCountLabel = MDLabel(textColor: .gray90)
    
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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()
        setDelegate()
        reactor?.action.onNext(.mapInset(DeviceSize(width: Constant.Screen.width,
                                                    height: Constant.Screen.height)))
      }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reactor?.action.onNext(.viewWillAppear)
        self.tabBarController?.tabBar.isHidden = false
    }
    
    init(reactor: HomeMapReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bind(reactor: HomeMapReactor) {
        let 서울Tap = 서울.rx.tapGesture().when(.recognized).map { _ in RegionType.서울 }
        let 경기도Tap = 경기도.rx.tapGesture().when(.recognized).map { _ in RegionType.경기도 }
        let 인천Tap = 인천.rx.tapGesture().when(.recognized).map { _ in RegionType.인천 }
        let 강원도Tap = 강원도.rx.tapGesture().when(.recognized).map { _ in RegionType.강원도 }
        let 충청북도Tap = 충청북도.rx.tapGesture().when(.recognized).map { _ in RegionType.충청북도 }
        let 충청남도Tap = 충청남도.rx.tapGesture().when(.recognized).map { _ in RegionType.충남·세종 }
        let 대전Tap = 대전.rx.tapGesture().when(.recognized).map { _ in RegionType.대전 }
        let 경상북도Tap = 경상북도.rx.tapGesture().when(.recognized).map { _ in RegionType.경상북도 }
        let 경상남도Tap = 경상남도.rx.tapGesture().when(.recognized).map { _ in RegionType.경상남도 }
        let 대구Tap = 대구.rx.tapGesture().when(.recognized).map { _ in RegionType.대구 }
        let 울산Tap = 울산.rx.tapGesture().when(.recognized).map { _ in RegionType.울산 }
        let 부산Tap = 부산.rx.tapGesture().when(.recognized).map { _ in RegionType.부산 }
        let 전라북도Tap = 전라북도.rx.tapGesture().when(.recognized).map { _ in RegionType.전라북도 }
        let 전라남도Tap = 전라남도.rx.tapGesture().when(.recognized).map { _ in RegionType.전라남도 }
        let 광주Tap = 광주.rx.tapGesture().when(.recognized).map { _ in RegionType.광주 }
        let 제주도Tap = 제주도.rx.tapGesture().when(.recognized).map { _ in RegionType.제주도 }
        let 외부Tap = mapContainerView.rx.tapGesture().when(.recognized).map { _ in RegionType.외부 }
        
        Observable.merge(서울Tap, 경기도Tap, 인천Tap, 강원도Tap, 충청북도Tap, 충청남도Tap, 대전Tap, 경상북도Tap,
                         경상남도Tap, 대구Tap, 울산Tap, 부산Tap, 전라북도Tap, 전라남도Tap, 광주Tap, 제주도Tap, 외부Tap)
        .map { type in Reactor.Action.mapAction(type)}
        .bind(to: reactor.action)
        .disposed(by: disposeBag)
        
        reactor.state.compactMap{ $0.inset }
            .withUnretained(self)
            .subscribe { _, inset in
                self.setLayout(inset: TopAndLeadingInset(top: inset.top, leading: inset.leading))
            }
            .disposed(by: disposeBag)
        
        reactor.state.compactMap { $0.totalMapState }
            .withUnretained(self)
            .subscribe { _, data in
                for model in data.totalMapArray {
                    switch model.mapName {
                    case "서울":
                        self.서울.bindMapUI(color: model.mapColor)
                    case "경기도":
                        self.경기도.bindMapUI(color: model.mapColor)
                    case "인천":
                        self.인천.bindMapUI(color: model.mapColor)
                    case "강원도":
                        self.강원도.bindMapUI(color: model.mapColor)
                    case "충청북도":
                        self.충청북도.bindMapUI(color: model.mapColor)
                    case "충남·세종":
                        self.충청남도.bindMapUI(color: model.mapColor)
                    case "대전":
                        self.대전.bindMapUI(color: model.mapColor)
                    case "경상북도":
                        self.경상북도.bindMapUI(color: model.mapColor)
                    case "경상남도":
                        self.경상남도.bindMapUI(color: model.mapColor)
                    case "대구":
                        self.대구.bindMapUI(color: model.mapColor)
                    case "울산":
                        self.울산.bindMapUI(color: model.mapColor)
                    case "부산":
                        self.부산.bindMapUI(color: model.mapColor)
                    case "전라북도":
                        self.전라북도.bindMapUI(color: model.mapColor)
                    case "전라남도":
                        self.전라남도.bindMapUI(color: model.mapColor)
                    case "광주":
                        self.광주.bindMapUI(color: model.mapColor)
                    case "제주도":
                        self.제주도.bindMapUI(color: model.mapColor)
                    default: break
                    }
                }
                
                if let mapData = data.selectedMap {
                    self.recordButton.isHidden = false
                    self.recordButton.setText(attributedString: NSAttributedString.pretendardB16("\(mapData.selectedMapName)에 기록 추가하기"),
                                              color: .mapWhite)
                } else {
                    self.recordButton.isHidden = true
                }
                
                self.mapCountLabel.attributedText = NSAttributedString.pretendardM16(data.visitedMapCount)
            }
            .disposed(by: disposeBag)
        
        recordButton.rx.tap
            .withLatestFrom(reactor.state)
            .compactMap { $0.totalMapState?.selectedMap?.selectedMapName }
            .asDriver(onErrorJustReturn: "서울")
            .drive(with: self) { owner, text in
                let recordReactor = RecordReactor(model: RecordModel(type: .write,
                                                                     region: text,
                                                                     place: nil,
                                                                     imageArray: nil,
                                                                     memo: nil,
                                                                     date: ""))
                let recordVC = RecordViewController(reactor: recordReactor)
                owner.navigationController?.pushViewController(recordVC, animated: true)
                
                recordVC.completeButtonTapped
                    .asDriver(onErrorJustReturn: ())
                    .drive(with: self) { _, _ in
                        MDToast.show(type: .complete)
                    }
                    .disposed(by: recordVC.disposeBag)
            }
            .disposed(by: disposeBag)
    }
    
    // MARK: - Method
    
    private func setUI() {
        self.recordButton.isHidden = true
    }
    
    private func setDelegate() {
        homeScrollView.delegate = self
    }
    
    // MARK: - Layout
    
    private func setLayout(inset: TopAndLeadingInset) {
        view.addSubviews(homeScrollView, recordButton, visitedMapCountView)
        homeScrollView.addSubviews(mapContainerView)
        mapContainerView.addSubviews(서울, 경기도, 인천, 강원도, 충청북도, 충청남도,
                                     대전, 경상북도, 경상남도, 대구, 울산, 부산, 전라북도,
                                     전라남도, 광주, 제주도)
        visitedMapCountView.addSubviews(shoesImageView, mapCountLabel)
        
        homeScrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        mapContainerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalToSuperview().inset(inset.top)
            make.leading.equalToSuperview().inset(inset.leading)
        }
        
        recordButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(11)
            make.height.equalTo(52)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
        }
        
        visitedMapCountView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(14)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(17)
            make.width.equalTo(87)
            make.height.equalTo(38)
        }
        
        shoesImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(30)
        }
        
        mapCountLabel.snp.makeConstraints { make in
            make.leading.equalTo(shoesImageView.snp.trailing).offset(4)
            make.centerY.equalTo(shoesImageView)
        }
    }
    
}

// MARK: - UIScrollViewDelegate

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

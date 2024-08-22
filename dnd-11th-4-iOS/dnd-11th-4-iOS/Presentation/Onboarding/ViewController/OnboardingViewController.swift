//
//  OnboardingViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import AdSupport
import AppTrackingTransparency

import UIKit
import SnapKit
import Lottie
import RxSwift
import RxCocoa
import ReactorKit

final class OnboardingViewController: UIViewController {
    typealias Reactor = OnboardingReactor
    var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - UI Properties
    
    private let onboardingView: OnboardingView = OnboardingView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        requestPermission()
        setupUI()
        bindActions()
    }
    
    init(reactor: OnboardingReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        view.addSubview(onboardingView)
        
        onboardingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Bind
    
    private func bindActions() {
        // 색상 선택 이벤트 전달
        onboardingView.colorSelected
            .withUnretained(self)
            .subscribe(onNext: { owner, color in
                owner.reactor?.action.onNext(.selectColor(color))
            })
            .disposed(by: disposeBag)
        
        onboardingView.selectButton.rx.tap
            .asDriver()
            .delay(.milliseconds(300))
            .drive(onNext: { [weak self] in
                guard let self = self else { return }
                self.navigateToViewController(viewController: TabBarViewController())
            })
            .disposed(by: disposeBag)
    }
}

extension OnboardingViewController: View {
    func bind(reactor: OnboardingReactor) {
        reactor.state
            .compactMap { $0.selectedAnimation }
            .distinctUntilChanged()
            .asDriver(onErrorJustReturn: "다시 시도해주세요.")
            .drive(onNext: { [weak self] animationName in
                guard let self = self else { return }
                self.onboardingView.updateAnimationView(with: animationName)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - App Tracking Transparency

extension OnboardingViewController {
    func requestPermission() {
        if #available(iOS 14, *) {
            ATTrackingManager.requestTrackingAuthorization { status in
                switch status {
                case .authorized:
                    print("Authorized")
                    print(ASIdentifierManager.shared().advertisingIdentifier)
                case .denied:
                    print("Denied")
                case .notDetermined:
                    print("Not Determined")
                case .restricted:
                    print("Restricted")
                @unknown default:
                    print("Unknown")
                }
            }
        }
    }
}

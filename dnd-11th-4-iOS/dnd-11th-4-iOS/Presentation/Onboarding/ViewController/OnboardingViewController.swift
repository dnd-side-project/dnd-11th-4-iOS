//
//  OnboardingViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit
import SnapKit
import Lottie
import RxSwift
import RxCocoa
import ReactorKit

final class OnboardingViewController: UIViewController {
    typealias Reactor = OnboardingReactor
    
    private let onboardingView: OnboardingView = OnboardingView()
    var disposeBag: DisposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupUI()
        bind(reactor: reactor!)
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
                self.navigateToTabBarViewController()
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Method
    
    private func navigateToTabBarViewController() {
        let rootViewController = TabBarViewController()
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = rootViewController
            UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        }
    }
}

extension OnboardingViewController: View {
    func bind(reactor: OnboardingReactor) {
        reactor.state
            .compactMap { $0.selectedAnimation }
            .distinctUntilChanged()
            .withUnretained(self)
            .subscribe(onNext: { owner, animationName in
                owner.onboardingView.updateAnimationView(with: animationName)
            })
            .disposed(by: disposeBag)
    }
}

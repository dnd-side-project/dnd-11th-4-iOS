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
    private let onboardingView: OnboardingView = OnboardingView()
    var reactor: OnboardingReactor?
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
            .subscribe(onNext: { [weak self] color in
                self?.reactor?.action.onNext(.selectColor(color))
            })
            .disposed(by: disposeBag)
        
        onboardingView.selectButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.navigateToTabBarViewController()
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Method
    
    private func navigateToTabBarViewController() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            let rootViewController = TabBarViewController()
            if let window = UIApplication.shared.windows.first {
                window.rootViewController = rootViewController
                UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        }
    }
}

extension OnboardingViewController: View {
    func bind(reactor: OnboardingReactor) {
        reactor.state
            .map { $0.selectedAnimation }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] animationName in
                guard let self = self, let animationName = animationName else { return }
                self.onboardingView.updateAnimationView(with: animationName)
            })
            .disposed(by: disposeBag)
    }
}

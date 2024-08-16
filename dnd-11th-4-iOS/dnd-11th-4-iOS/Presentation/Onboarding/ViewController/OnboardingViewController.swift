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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setupUI()
        bind(reactor: reactor!)
    }
    
    init(reactor: OnboardingReactor) {
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        view.addSubview(onboardingView)
        
        onboardingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension OnboardingViewController: View {
    func bind(reactor: OnboardingReactor) {
        onboardingView.colorSelected
            .map { Reactor.Action.selectColor($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
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

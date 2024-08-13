//
//  OnboardingViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit
import SnapKit
import Lottie

final class OnboardingViewController: UIViewController {
    
    private let onboardingView = OnboardingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        setLayout()
    }
    
    func setLayout() {
        view.addSubview(onboardingView)
        
        onboardingView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

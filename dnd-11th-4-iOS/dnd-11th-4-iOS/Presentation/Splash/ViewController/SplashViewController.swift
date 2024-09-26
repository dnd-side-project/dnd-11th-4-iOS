//
//  SplashViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/16/24.
//

import UIKit
import SnapKit

final class SplashViewController: UIViewController {
    private let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    private let descriptionLabel: MDLabel = {
        let label = MDLabel(attributedString: NSAttributedString.pretendardSB16("방방곡곡 대한민국 도장깨기"), textColor: .mapWhite, alignment: .center)
        return label
    }()
    
    private let splashImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Constant.Image.logoWhite
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setRootViewController()
    }
    
    // MARK: - Layout
    
    private func setupUI() {
        self.navigationController?.navigationBar.isHidden = true
        let backgroundLayer = CAGradientLayer()
        backgroundLayer.colors = [
            UIColor(red: 0.567, green: 0.896, blue: 1, alpha: 1).cgColor,
            UIColor(red: 0, green: 0.643, blue: 0.846, alpha: 1).cgColor
        ]
        backgroundLayer.locations = [0, 1]
        backgroundLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        backgroundLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        backgroundLayer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 0.81, c: -0.81, d: 0, tx: 0.91, ty: 0))
        backgroundLayer.frame = view.bounds
        view.layer.addSublayer(backgroundLayer)
        
        view.addSubviews(descriptionLabel, splashImageView)
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(168)
            $0.leading.trailing.equalToSuperview()
        }
        splashImageView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(68)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setRootViewController() {
        if appDelegate?.isLogin == true {
            navigateToViewController(viewController: TabBarViewController())
        } else {
            navigateToViewController(viewController: LoginViewController(reactor: LoginReactor()), delay: 2.0)
        }
    }
}

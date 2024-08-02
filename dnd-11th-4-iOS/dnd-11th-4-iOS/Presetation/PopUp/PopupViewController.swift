//
//  PopupViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/2/24.
//

import UIKit

class PopupViewController: UIViewController {
    
    private let dimmedView = UIView()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalTransitionStyle = .crossDissolve
        modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        dimmedView.backgroundColor = .black2
        dimmedView.alpha = 0
        self.view.addSubview(dimmedView)
        
        dimmedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0.3
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIView.animate(withDuration: 0.3) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            self.dimmedView.removeFromSuperview()
        }
    }
}

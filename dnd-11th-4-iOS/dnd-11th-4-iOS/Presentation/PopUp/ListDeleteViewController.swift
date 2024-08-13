//
//  ListDeleteViewController.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/11/24.
//

import UIKit
import SnapKit

final class ListDeleteViewController: PopUpViewController {
    private let popUpView = MDPopUpView()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupPopUpView()
    }
    
    private func setupPopUpView() {
        view.addSubview(popUpView)
        
        popUpView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(117)
            $0.width.equalTo(293)
        }
    }
}

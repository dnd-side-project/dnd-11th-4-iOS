//
//  MDToast.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 8/2/24.
//

import UIKit

final class MDToast {
    static func show(type: ToastViewType) {
        let toastView = MDToastView(type: type)
        guard let window = UIApplication.shared.windows.first(where: \.isKeyWindow) else { return }
        window.subviews
            .filter { $0 is MDToastView }
            .forEach { $0.removeFromSuperview() }
        window.addSubview(toastView)
        
        switch type {
        case .delete:
            toastView.snp.makeConstraints { make in
                make.height.equalTo(36)
                make.width.equalTo(136)
                make.centerY.centerX.equalToSuperview()
            }
        default:
            toastView.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.top.equalTo(window.safeAreaLayoutGuide.snp.top).offset(31)
                make.leading.trailing.equalToSuperview().inset(26)
            }
        }
        
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastView.alpha = 0.0
        }, completion: {(isCompleted) in
            toastView.removeFromSuperview()
        })
    }
}

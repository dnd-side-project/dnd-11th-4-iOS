//
//  UIViewController+.swift
//  dnd-11th-4-iOS
//
//  Created by Allie on 8/21/24.
//

import UIKit

extension UIViewController {
    func navigateToViewController(viewController: UIViewController, animated: Bool = true, delay: TimeInterval? = nil) {
        let transition = {
            let rootViewController = UINavigationController(rootViewController: viewController)
            if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                window.windows.first?.rootViewController = rootViewController
                
                if animated {
                    UIView.transition(with: window.windows.first!, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
                }
            }
        }
        
        if let delay = delay {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: transition)
        } else {
            transition()
        }
    }
}

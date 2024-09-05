//
//  TabBarViewController.swift
//  dnd-11th-4-iOS
//
//  Created by 황찬미 on 7/31/24.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        setTabBarAppearance()
        setTabBarUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTabBarHeight()
    }
}

private extension TabBarViewController {
    
    private func setTabBar() {
        let homeViewController = UINavigationController(rootViewController: HomeMapViewController(reactor: HomeMapReactor()))
        homeViewController.isNavigationBarHidden = true
        homeViewController.makeTabBar(title: "지도",
                                      tabBarImg: Constant.Image.iconMapGray!,
                                      tabBarSelectedImg: Constant.Image.iconMapBlack!,
                                      renderingMode: .alwaysOriginal)
        
        let recordListViewController = UINavigationController(rootViewController: RecordListViewController(reactor: RecordListReactor()))
        recordListViewController.isNavigationBarHidden = true
        recordListViewController.makeTabBar(title: "기록",
                                            tabBarImg: Constant.Image.iconPencilGray!,
                                            tabBarSelectedImg: Constant.Image.iconPencilBlack!,
                                      renderingMode: .alwaysOriginal)
        
        let myPageViewController = UINavigationController(rootViewController: MyPageViewController(reactor: MyPageReactor()))
        myPageViewController.isNavigationBarHidden = true
        myPageViewController.makeTabBar(title: "마이페이지",
                                        tabBarImg: Constant.Image.iconMyPageGray!,
                                        tabBarSelectedImg: Constant.Image.iconMyPageBlack!,
                                      renderingMode: .alwaysOriginal)
        
        self.viewControllers = [homeViewController, recordListViewController, myPageViewController]
    }
    
    func setTabBarHeight() {
        tabBar.frame.size.height = 95
        tabBar.frame.origin.y = view.frame.height - 95
    }
    
    func setTabBarAppearance() {
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.stackedLayoutAppearance.normal.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        tabBarAppearance.stackedLayoutAppearance.selected.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.gray60, .font: UIFont(name: "Pretendard-SemiBold", size: 10)!]
        tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: UIColor.black2,.font: UIFont(name: "Pretendard-SemiBold", size: 10)!]
        self.tabBar.standardAppearance = tabBarAppearance
    }
    
    func setTabBarUI() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black2
        tabBar.layer.cornerRadius = 8
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        tabBar.layer.masksToBounds = true
        tabBar.layer.borderColor = UIColor.gray40.cgColor
        tabBar.layer.borderWidth = 1
    }
}

extension UINavigationController {
    func makeTabBar(title: String,
                    tabBarImg: UIImage,
                    tabBarSelectedImg: UIImage,
                    renderingMode: UIImage.RenderingMode) {
        
        self.tabBarItem = UITabBarItem(title: title,
                                       image: tabBarImg.withRenderingMode(renderingMode),
                                       selectedImage: tabBarSelectedImg.withRenderingMode(renderingMode))
    }
}

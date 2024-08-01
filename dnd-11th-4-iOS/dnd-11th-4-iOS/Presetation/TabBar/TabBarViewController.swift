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
        
        setTabBarAppearance()
        setTabBarUI()
        
        let homeViewController = UINavigationController(rootViewController: HomeViewController())
        homeViewController.isNavigationBarHidden = true
        homeViewController.makeTabBar(title: "지도",
                                      tabBarImg: UIImage(named: "IconMapGray")!,
                                      tabBarSelectedImg: UIImage(named:"IconMapBlack")!,
                                      renderingMode: .alwaysOriginal)
        
        let recordListViewController = UINavigationController(rootViewController: RecordListViewController())
        recordListViewController.makeTabBar(title: "기록",
                                            tabBarImg: UIImage(named: "IconPencilGray")!,
                                            tabBarSelectedImg: UIImage(named: "IconPencilBlack")!,
                                      renderingMode: .alwaysOriginal)
        
        let myPageViewController = UINavigationController(rootViewController: MyPageViewController())
        myPageViewController.makeTabBar(title: "마이페이지",
                                        tabBarImg: UIImage(named: "IconMyPageGray")!,
                                        tabBarSelectedImg: UIImage(named: "IconMyPageBlack")!,
                                      renderingMode: .alwaysOriginal)
        
        self.viewControllers = [homeViewController, recordListViewController, myPageViewController]
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setTabBarHeight()
    }
}

private extension TabBarViewController {
    
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
        tabBar.layer.applyShadow()
//        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = tabBar.frame.height * 0.41
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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

//
//  TabBarView.swift
//  HW 11
//
//  Created by Игорь Крысин on 05.05.2024.
//

import UIKit

class TabBarView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
        
    }
    
    func setupVC() {
        let mainVC = UINavigationController(rootViewController: MainViewController()) 
        let messageVC = UINavigationController(rootViewController:MessageViewController())
        let profileVC = ProfileViewController()
        
        setTabBar(vc: mainVC, title: "Main")
        setTabBar(vc: messageVC, title: "Message")
        setTabBar(vc: profileVC, title: "Profile")
        
        mainVC.tabBarItem.image = UIImage(systemName: "house")
        mainVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        messageVC.tabBarItem.image = UIImage(systemName: "message")
        messageVC.tabBarItem.selectedImage = UIImage(systemName: "message.fill")
        messageVC.tabBarItem.badgeValue = "6"
        
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        profileVC.tabBarItem.selectedImage = UIImage(systemName: "person.fill")
        
        setViewControllers([mainVC, messageVC, profileVC], animated: false)
        
      
    }
    
    private func setTabBar(vc: UIViewController, title: String) {
        let vc = vc
        vc.title = title
    }

}

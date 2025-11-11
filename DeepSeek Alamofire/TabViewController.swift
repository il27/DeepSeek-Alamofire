//
//  TabViewController.swift
//  DeepSeek Alamofire
//
//  Created by Ильяс on 11.11.2025.
//

import UIKit

class TabView: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .blue
        
        setTabs()
    }
    
    private func setTabs() {
        let deepSeekVC = ViewController()
        deepSeekVC.tabBarItem.title = "Home"
        deepSeekVC.tabBarItem.image = UIImage(systemName: "house")
        deepSeekVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        let photoVC = PhotoViewController()
        photoVC.tabBarItem.title = "Photo"
        photoVC.tabBarItem.image = UIImage(systemName: "photo")
        photoVC.tabBarItem.selectedImage = UIImage(systemName: "photo.fill")
        
        setViewControllers([deepSeekVC, photoVC], animated: false)
    }
}

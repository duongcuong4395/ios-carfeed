//
//  CustomTabbarController.swift
//  SwiftFaceBookFeed
//
//  Created by Duong Cuong on 9/11/19.
//  Copyright © 2019 Duong Cuong. All rights reserved.
//

import UIKit


class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //List Post
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navicgationController = UINavigationController(rootViewController: feedController)
        navicgationController.title = "List Post"
        navicgationController.tabBarItem.image = UIImage(named: "Icon_TabItem_ListStar")
        
        //List User
        let listUserController = ListUserController()
        listUserController.navigationItem.title = "List user"
        let listUserNavicgationController = UINavigationController(rootViewController: listUserController)
        listUserNavicgationController.title = "List User"
        listUserNavicgationController.tabBarItem.image = UIImage(named: "Icon_TabItem_ListUser")
        
        //List Bill
        let listBillController = UIViewController()
        listBillController.navigationItem.title = "Bills"
        let listBillNavicgationController = UINavigationController(rootViewController: listBillController)
        listBillNavicgationController.title = "List Bill"
        listBillNavicgationController.tabBarItem.image = UIImage(named: "Icon_TabItem_Bill")
        
        //User Profile
        let listUserProfileController = UIViewController()
        listUserProfileController.navigationItem.title = "Profile"
        let listUserProfileNavicgationController = UINavigationController(rootViewController: listUserProfileController)
        listUserProfileNavicgationController.title = "Profile"
        listUserProfileNavicgationController.tabBarItem.image = UIImage(named: "Icon_TabItem_UserProfile")
        
        
        
        viewControllers = [navicgationController, listUserNavicgationController, listBillNavicgationController, listUserProfileNavicgationController]
        
        let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0 as CGFloat, y: 0 as CGFloat, width: 1000 as CGFloat, height: 0.5 as CGFloat)
        topBorder.backgroundColor = UIColor.rgb(red: 229, green: 231, blue: 235).cgColor
        
        tabBar.layer.addSublayer(topBorder) 
        tabBar.clipsToBounds = true
    }
}

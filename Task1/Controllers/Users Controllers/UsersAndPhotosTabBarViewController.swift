//
//  UsersTabBarViewController.swift
//  Task1
//
//  Created by Swift Legends on 15/05/2019.
//  Copyright © 2019 Swift Legends. All rights reserved.
//

import UIKit

class UsersAndPhotosTabBarViewController: UITabBarController {

    var myTabBarItem = UITabBarItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white ], for: .selected)
        UIBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.darkGray ], for: .normal)
        
        let selectedImage1 = UIImage(named: "Profile_white")?.withRenderingMode(.alwaysOriginal)
        let deSelectedImage1 = UIImage(named: "Profile_gray")?.withRenderingMode(.alwaysOriginal)
        
        myTabBarItem = self.tabBar.items![0]
        
        myTabBarItem.image = deSelectedImage1
        myTabBarItem.selectedImage = selectedImage1
        
        let selectedImage2 = UIImage(named: "Alert_white")?.withRenderingMode(.alwaysOriginal)
        let deSelectedImage2 = UIImage(named: "Alert_gray")?.withRenderingMode(.alwaysOriginal)
        
        myTabBarItem = self.tabBar.items![1]
        
        myTabBarItem.image = deSelectedImage2
        myTabBarItem.selectedImage = selectedImage2
        
//        let numberOfTabs = CGFloat((tabBar.items?.count)!)
//        let tabBarSize = CGSize(width: (tabBar.frame.width)/numberOfTabs, height: tabBar.frame.height)
        
     //   tabBar.selectionIndicatorImage = UIImage.imageWithColor(Color: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), size: tabBarSize)

        
        self.selectedIndex = 0


    }


}

extension UIImage {
    
   class func imageWithColor(Color: UIColor, size: CGSize) -> UIImage{
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        Color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
        
    }
}

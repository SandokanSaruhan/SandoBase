//
//  TabBarController.swift
//  Template
//
//  Created by Kole, Saruhan (401-Extern) on 22.06.2022.
//  Copyright © 2022 Sando. All rights reserved.
//

import Foundation
import UIKit

class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        print("Tab Bar Menu Page")
        
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Design
        let item1 = Item1()
        let icon1 = UITabBarItem(title: "Title 1", image: UIImage(named: "flashOn"), selectedImage: UIImage(named: "flashOff"))
        
        let item2 = Item2()
        let icon2 = UITabBarItem(title: "Title 2", image: UIImage(named: "Item2NonSelected.png"), selectedImage: UIImage(named: "Item2Selected.png"))
        
        let item3 = Item3()
        let icon3 = UITabBarItem(title: "Title 3", image: UIImage(named: "Item3NonSelected.png"), selectedImage: UIImage(named: "Item3Selected.png"))
        
        let controllers = [item1,item2,item3]  //array of the root view controllers displayed by the tab bar interface
        
        self.viewControllers = controllers
    }

    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true;
    }
}

//Sando
//Edit tab bar 

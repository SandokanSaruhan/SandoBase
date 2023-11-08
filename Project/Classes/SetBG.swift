//
//  SetBG.swift
//  
//
//  Created by Saruhan Kole on 24.02.2020.
//  Copyright © 2020 Saruhan Kole. All rights reserved.
//

import Foundation
import UIKit

public class Design {
    
    let screenSize: CGRect = UIScreen.main.bounds
    
    class func bg() -> UIImageView
     {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        
        return backgroundImage
    }

}

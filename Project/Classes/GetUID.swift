//
//  GetUID.swift
//  
//
//  Created by Saruhan Kole on 24.02.2020.
//  Copyright © 2020 Saruhan Kole. All rights reserved.
//

import Foundation
import UIKit

class GetUid
{
    class func theUdid() -> String{
        let theUdid = UIDevice.current.identifierForVendor!.uuidString
        print("udid: \(theUdid)")
        
        return theUdid
    }
}

//
//  DataPhoto.swift
//  Navigation_1
//
//  Created by Nikita Gribin on 22.06.2022.
//

import Foundation
import UIKit


    
    
   var data: [UIImage] {
    
       var data = [UIImage]()
    for i in 1...20 {
            data.append(UIImage(named: "image\(i)")!)
    }
    return data
    }
    


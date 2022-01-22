//
//  AppColor.swift
//  Moviesta
//
//  Created by SODA on 22/01/2022.
//

import UIKit
import Foundation

enum AppColor {
    
    case mainColor,fontColor,ButtonColor
    
    var Color: UIColor {
        
        switch self {
            
        case .mainColor:
            return UIColor(red: 229/255, green: 229/255, blue: 229/255, alpha: 1.0)
        case.fontColor:
            return UIColor(red: 18/255, green: 21/255, blue: 61/255, alpha: 1.0)
        case.ButtonColor:
            return UIColor(red: 254/255, green: 109/255, blue: 142/255, alpha: 1.0)
        }
    }
    
}

//
//  MenuOption.swift
//  SideBar
//
//  Created by Jorge Pinedo on 6/26/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import UIKit

enum MenuOption: Int, CustomStringConvertible{
    case Profile
    case Inbox
    case Notifications
    case Settings
    
    var description: String{
        switch self {
        case .Profile: return "Profile"
        case .Inbox:return "Inbox"
        case .Notifications: return "Notifications"
        case .Settings: return "Settings"
        }
    }
    
    var image: UIImage{
        switch self {
        case .Profile: return UIImage(named: "profile") ?? UIImage()
        case .Inbox:return UIImage(named: "profile") ?? UIImage()
        case .Notifications:return UIImage(named: "profile") ?? UIImage()
        case .Settings:return UIImage(named: "profile") ?? UIImage()
        }
    }
    
}

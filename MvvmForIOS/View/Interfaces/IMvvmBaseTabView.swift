//
//  IMvvmBaseTabView.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 22/07/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit.UITabBarController

internal protocol IMvvmBaseTabView: class {
    var tabCtr: UITabBarController! {get set}
}

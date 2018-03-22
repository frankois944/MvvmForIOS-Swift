//
//  BaseServices.swift
//  MvvmForIOS
//
//  Created by Dabonot Francois on 04/01/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit

open class Setup: NSObject {
    
    private weak var _window:UIWindow?
    
    public init(window:UIWindow!) {
        NSLog("[MvvmForIOS]START setup")
        self._window = window
        ServiceLocator.register(service: NavigationService(window: window) as INavigationService)
    }
}

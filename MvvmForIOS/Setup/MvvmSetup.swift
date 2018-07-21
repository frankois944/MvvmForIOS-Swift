//
//  BaseServices.swift
//  MvvmForIOS
//
//  Created by Dabonot Francois on 04/01/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit

open class MvvmSetup: NSObject {

    private weak var _window: UIWindow!

    public init(window: UIWindow) {
        NSLog("[MvvmForIOS]START setup")
        self._window = window
        MvvmServiceLocator.register(service: MvvmNavigationService(window: window) as IMvvmNavigationService)
    }

    public init(window: UIWindow, customNavigationController: UINavigationController.Type) {
        NSLog("[MvvmForIOS]START setup")
        self._window = window
        MvvmServiceLocator.register(service: MvvmNavigationService(window: window, customNavigationController: customNavigationController) as IMvvmNavigationService)
    }
}

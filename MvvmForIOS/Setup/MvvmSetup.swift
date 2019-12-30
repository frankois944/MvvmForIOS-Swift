//
//  BaseServices.swift
//  MvvmForIOS
//
//  Created by Dabonot Francois on 04/01/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
/**
 *
 */
open class MvvmSetup {
    /**
     * Do Nothing but mandatory, don't call directly
     */
    public init() {
        assertionFailure("cant be called directly")
    }
    /**
     * Entry point of the Mvvm Framework with a basic presenter (MvvmBasicPresenter)
     *
     *  - parameters:
     *      - window: The main app window, the framework will use it for navigation
     *      - presenter: The presenter who manage the navigation between viewmodel
     *      - container: The container manager
     *
     *  - Important:
     *  This method must be call before everything
     **/
    public init(window: UIWindow,
                presenter: IMvvmPresenter.Type = MvvmBasicPresenter.self,
                container: IMvvmContainer.Type = MvvmBasicContainer.self) {
        NSLog("[MvvmForIOS]START setup")
        let mpresenter = presenter.init(window: window)
        let mcontainer = container.init()
        MvvmServiceLocator.register(service: MvvmNavigationService(presenter: mpresenter, container: mcontainer) as IMvvmNavigationService)
    }
}

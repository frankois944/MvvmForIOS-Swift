//
//  MvvmSetup.swift
//  MvvmForIOS.SidePanel
//
//  Created by Francois Dabonot on 20/11/2018.
//  Copyright © 2018 Francois Dabonot. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

public extension MvvmSetup {
    /**
     * Init the Mvvm Framework with a Side pannel presenter
     */
    public convenience init(window: UIWindow) {
        self.init()
        NSLog("[MvvmForIOS]START setup")
        let instance = MvvmNavigationService(sidePannelPresenter: MvvmSidePanelPresenter(window: window), container: MvvmBasicContainer())
        MvvmServiceLocator.register(service: instance as IMvvmNavigationService)
        MvvmServiceLocator.register(service: instance as ISideMvvmNavigationService)
    }

    /**
     * Init the Mvvm Framework with a Side pannel presenter
     */
	public convenience init(sidePannelpresenter: IMvvmSidePanelPresenter, container: IMvvmContainer) {
        self.init()
        NSLog("[MvvmForIOS]START setup")
		let instance = MvvmNavigationService(sidePannelPresenter: sidePannelpresenter, container: container)
        MvvmServiceLocator.register(service: instance as IMvvmNavigationService)
        MvvmServiceLocator.register(service: instance as ISideMvvmNavigationService)
    }
}

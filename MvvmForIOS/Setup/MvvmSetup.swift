//
//  BaseServices.swift
//  MvvmForIOS
//
//  Created by Dabonot Francois on 04/01/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit

open class MvvmSetup {
	/*
	* Do Nothing but mandatory
	* Don't call directly
	*/
	public init() {
	}
    /**
     * Init the Mvvm Framework with a basic presenter (MvvmBasicPresenter)
     */
	public init(window: UIWindow, presenter: IMvvmPresenter.Type = MvvmBasicPresenter.self, container: IMvvmContainer.Type = MvvmBasicContainer.self) {
        NSLog("[MvvmForIOS]START setup")
		let mpresenter = presenter.init(window: window)
		let mcontainer = container.init()
		MvvmServiceLocator.register(service: MvvmNavigationService(presenter: mpresenter, container: mcontainer) as IMvvmNavigationService)
    }
}

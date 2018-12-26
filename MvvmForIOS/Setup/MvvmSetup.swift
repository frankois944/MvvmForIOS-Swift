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
    public init(window: UIWindow) {
        NSLog("[MvvmForIOS]START setup")
		MvvmServiceLocator.register(service: MvvmNavigationService(presenter: MvvmBasicPresenter(window: window), container: MvvmBasicContainer()) as IMvvmNavigationService)
    }

    /**
     * Init the Mvvm Framework with a custom presenter
     */
	public init(presenter: IMvvmPresenter, container: IMvvmContainer) {
        NSLog("[MvvmForIOS]START setup")
		MvvmServiceLocator.register(service: MvvmNavigationService(presenter: presenter, container: container) as IMvvmNavigationService)
    }
}

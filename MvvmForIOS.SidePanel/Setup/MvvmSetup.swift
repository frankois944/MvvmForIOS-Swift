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

	public convenience init(windowForSidePanel: UIWindow, sidePresenter: IMvvmSidePanelPresenter.Type = MvvmSidePanelPresenter.self, container: IMvvmContainer.Type = MvvmBasicContainer.self) {
		self.init()
		NSLog("[MvvmForIOS]START setup")
		let mpresenter = sidePresenter.init(window: windowForSidePanel)
		let mcontainer = container.init()
		let instance = MvvmNavigationService(sidePannelPresenter: mpresenter, container: mcontainer)
		MvvmServiceLocator.register(service: instance as IMvvmNavigationService)
		MvvmServiceLocator.register(service: instance as ISideMvvmNavigationService)
	}
}

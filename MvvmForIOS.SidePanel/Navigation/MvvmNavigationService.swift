//
//  MvvmSidePanelNavigationService.swift
//  MvvmForIOS.SidePanel
//
//  Created by Francois Dabonot on 20/11/2018.
//  Copyright © 2018 Francois Dabonot. All rights reserved.
//

import MvvmForIOSSwift
import UIKit

open class MvvmNavigationService: MvvmForIOSSwift.MvvmNavigationService, ISideMvvmNavigationService {

    var presenter: IMvvmSidePanelPresenter!

    convenience init(sidePannelPresenter: IMvvmSidePanelPresenter) {
        self.init(presenter: sidePannelPresenter)
        self.presenter = sidePannelPresenter
    }

    public func showLeftPanel(animated: Bool) {
        print("showLeftPanel \(animated)")
        self.presenter.showLeftPanel(animated: animated)
    }

    public func showRightPanel(animated: Bool) {
        print("showRightPanel \(animated)")
        self.presenter.showRightPanel(animated: animated)
    }

    public func hideLeftPanel(animated: Bool) {
        print("hideLeftPanel \(animated)")
        self.presenter.showLeftPanel(animated: animated)
    }

    public func hideRightPanel(animated: Bool) {
        print("hideRightPanel \(animated)")
        self.presenter.hideRightPanel(animated: animated)
    }
}

//
//  IMvvmSidePanelPresenter.swift
//  MvvmForIOS.SidePanel
//
//  Created by Francois Dabonot on 20/11/2018.
//  Copyright © 2018 Francois Dabonot. All rights reserved.
//

import MvvmForIOSSwift

public protocol IMvvmSidePanelPresenter: IMvvmPresenter {
    func showLeftPanel(animated: Bool)
    func showRightPanel(animated: Bool)
    func hideLeftPanel(animated: Bool)
    func hideRightPanel(animated: Bool)
}

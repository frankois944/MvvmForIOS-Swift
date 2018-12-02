//
//  MvvmSidePanelPresenter.swift
//  MvvmForIOSSwift.SidePanel
//
//  Created by Francois Dabonot on 20/11/2018.
//  Copyright © 2018 Francois Dabonot. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

open class MvvmSidePanelPresenter: MvvmBasicPresenter, IMvvmSidePanelPresenter {

    var baseNavigation: UINavigationController = UINavigationController()
    private var modalViewController: UIViewController?

    required public init(window: UIWindow) {
        super.init(window: window)
    }

    public func showLeftPanel(animated: Bool) {
    }

    public func showRightPanel(animated: Bool) {
    }

    public func hideLeftPanel(animated: Bool) {
    }

    public func hideRightPanel(animated: Bool) {
    }

    open override func show<T: IMvvmBaseViewModel>(request: MvvmRequest<T>) {
       super.show(request: request)
    }

    open override func close<T: IMvvmBaseViewModel>(viewModel: T) {
       super.close(viewModel: viewModel)
    }
}

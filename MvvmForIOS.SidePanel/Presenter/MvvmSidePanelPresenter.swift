//
//  MvvmSidePanelPresenter.swift
//  MvvmForIOSSwift.SidePanel
//
//  Created by Francois Dabonot on 20/11/2018.
//  Copyright © 2018 Francois Dabonot. All rights reserved.
//

import UIKit
import MvvmForIOSSwift
import MvvmForIOSSwift_SidePanel_Private

open class MvvmSidePanelPresenter: MvvmBasicPresenter, IMvvmSidePanelPresenter {

    var baseNavigation = LGSideMenuController()
    private var modalViewController: UIViewController?

    required public init(window: UIWindow) {
        super.init(window: window)
    }

    public func showLeftPanel(animated: Bool) {
        animated == true ? baseNavigation.showLeftViewAnimated() : baseNavigation.showLeftView()
    }

    public func showRightPanel(animated: Bool) {
        animated == true ? baseNavigation.showRightViewAnimated() : baseNavigation.showRightView()
    }

    public func hideLeftPanel(animated: Bool) {
        animated == true ? baseNavigation.hideLeftViewAnimated() : baseNavigation.hideLeftView()
    }

    public func hideRightPanel(animated: Bool) {
        animated == true ? baseNavigation.hideRightViewAnimated() : baseNavigation.hideRightView()
    }

    open override func show<T: IMvvmBaseViewModel>(request: MvvmRequest<T>) {
        let view = MvvmNavigationUtility.loadView(request: request)
        if view is IMvvmLeftPanelAttribute {
            if view is IMvvmRootAttribute {
                baseNavigation.leftViewController = UINavigationController(rootViewController: view)
            } else {
                (baseNavigation.leftViewController as? UINavigationController)?.pushViewController(view, animated: MvvmNavigationUtility.getIsAnimatedForOpen(view: view))
            }
        } else if view is IMvvmLeftPanelAttribute {
            if view is IMvvmRootAttribute {
                baseNavigation.rightViewController = UINavigationController(rootViewController: view)
            } else {
                (baseNavigation.rightViewController as? UINavigationController)?.pushViewController(view, animated: MvvmNavigationUtility.getIsAnimatedForOpen(view: view))
            }
        } else {
            if view is IMvvmRootAttribute {
                baseNavigation.rootViewController = UINavigationController(rootViewController: view)
            } else {
                (baseNavigation.rootViewController as? UINavigationController)?.pushViewController(view, animated: MvvmNavigationUtility.getIsAnimatedForOpen(view: view))
            }
        }
    }

    open override func close<T: IMvvmBaseViewModel>(viewModel: T) {
        if modalViewController != nil {
            modalViewController?.dismiss(animated: MvvmNavigationUtility.getIsAnimatedForClose(view: modalViewController!), completion: nil)
            modalViewController = nil
        } else if let navCtr = baseNavigation.leftViewController as? UINavigationController, MvvmNavigationUtility.isViewModelExistInNavigation(viewModel: viewModel, navigationController: navCtr) == true {
            (baseNavigation.leftViewController as? UINavigationController)!.popViewController(animated: true)
        } else if let navCtr = baseNavigation.rightViewController as? UINavigationController, MvvmNavigationUtility.isViewModelExistInNavigation(viewModel: viewModel, navigationController: navCtr) == true {
            (baseNavigation.rightViewController as? UINavigationController)!.popViewController(animated: true)
        } else if let navCtr = baseNavigation.rootViewController as? UINavigationController, MvvmNavigationUtility.isViewModelExistInNavigation(viewModel: viewModel, navigationController: navCtr) == true {
            (baseNavigation.rootViewController as? UINavigationController)!.popViewController(animated: true)
        } else {
            NSLog("[MvvmForIOS]No View Found or is RootView for %@", String(describing: type(of: viewModel)))
        }
    }
}

//
//  MvvmBasicPresenter.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 17/11/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit
import MvvmForIOSSwift_Private

open class MvvmBasicPresenter: IMvvmPresenter {

    private var modalViewController: UIViewController?
    public let window: UIWindow

    required public init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = navigationController
    }

    public var navigationController: UIViewController {
        guard let navController = self.window.rootViewController as? UINavigationController else {
            return (UINavigationController())
        }
        return (navController)
    }

    open func show<T: IMvvmBaseViewModel>(request: MvvmRequest<T>) {
        let view = MvvmNavigationUtility.getView(viewModel: request.viewModel, withParameters: request.parameters, mustStart: true)
        if MvvmNavigationUtility.getIsModal(view: view) == true {
            self.presentModal(request: request, view: view)
        } else {
            (navigationController as? UINavigationController)?.pushViewController(view, animated: MvvmNavigationUtility.getIsAnimatedForOpen(view: view))
        }
    }

    open func close<T: IMvvmBaseViewModel>(viewModel: T) {
        //should be only one modal at a time
        //so if modalViewController is not nil, it's presented and can be dismiss
        if modalViewController != nil {
            closeModal()
        } else if let navigationController = navigationController as? UINavigationController {
            guard let view = MvvmNavigationUtility.getViewFromViewModel(viewModel: viewModel, navigationController: navigationController) else {
                print("No View to close found for viewModel \(viewModel)")
                return
            }
            if view.isEqual(navigationController.topViewController) {
                navigationController.popViewController(animated: MvvmNavigationUtility.getIsAnimatedForClose(view: view))
            } else {
                navigationController.viewControllers.removeAll {
                    return ($0 == view)
                }
            }
        }
    }

    // MARK: Utilities

    private func closeModal() {
        modalViewController!.dismiss(animated: MvvmNavigationUtility.getIsAnimatedForClose(view: modalViewController!), completion: nil)
        modalViewController = nil
    }

    private func presentModal<T: IMvvmBaseViewModel>(request: MvvmRequest<T>, view: UIViewController) {
        request.customizeModalTransition?(view)
        if let topView = (navigationController as? UINavigationController)?.topViewController {
            topView.present(view, animated: MvvmNavigationUtility.getIsAnimatedForOpen(view: view), completion: nil)
            modalViewController = view
        }
    }
}

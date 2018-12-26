//
//  MvvmNavigationUtility.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 18/11/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

public class MvvmNavigationUtility {

    static public func getIsAnimatedForOpen(view: UIViewController) -> Bool {
        var animated: Bool = true
        if let viewToTest = view as? IMvvmTransitionAttribute {
            animated = viewToTest.isOpenTransitionAnimated
        }
        return (animated)
    }

    static public func getIsModal(view: UIViewController) -> Bool {
        if view is IMvvmModalView {
            return (true)
        }
        return (false)
    }

    static public func getIsAnimatedForClose(view: UIViewController) -> Bool {
        var animated: Bool = true
        if let viewToTest = view as? IMvvmTransitionAttribute {
            animated = viewToTest.isCloseTransitionAnimated
        }
        return (animated)
    }

    static public func isViewModelExistInNavigation<T: IMvvmBaseViewModel>(viewModel: T, navigationController: UINavigationController) -> Bool {
        return (getViewFromViewModel(viewModel: viewModel, navigationController: navigationController) != nil)
    }

    static public func getViewFromViewModel<T: IMvvmBaseViewModel>(viewModel: T, navigationController: UINavigationController) -> UIViewController? {
        let views = navigationController.viewControllers
        if views.count > 1 {
            for view in views {
                guard let viewToTest = view as? IMvvmView else {
                    continue
                }
                if Unmanaged.passUnretained(viewToTest.viewModelObject as AnyObject).toOpaque() == Unmanaged.passUnretained(viewModel as AnyObject).toOpaque() {
                    return (view)
                }
            }
        }
        return (nil)
    }

    static public func loadView<T: IMvvmBaseViewModel>(request: MvvmRequest<T>, mustStart: Bool = false) -> UIViewController {
        let newViewModel = request.viewModel.init()
        if mustStart == true {
            newViewModel.startViewModel(parameters: request.parameters)
        }
        // Store ViewModel in View
		// crash if the View is not a IMvvmView (it's a choice!)
        (request.view as? IMvvmView)!.viewModelObject = newViewModel
		return (request.view)
    }
}

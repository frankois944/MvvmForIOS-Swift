//
//  MvvmNavigationUtility.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 18/11/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit
import MvvmForIOSSwift_Private

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

    static public func getView<T: IMvvmBaseViewModel>(viewModel: T.Type, withParameters: Any?, mustStart: Bool = false) -> UIViewController {
        let classname = NSStringFromClass((viewModel as? AnyClass)!)
        let module = classname.components(separatedBy: ".").first!
        // getting view name
        let shortClassname = classname.replacingOccurrences(of: module+".", with: "")
        var storyboardName = shortClassname.replacingOccurrences(of: "ViewModel", with: "")
        let viewName = shortClassname.replacingOccurrences(of: "Model", with: "")
        // getting the storyboardName from the associate view
        let viewControllerIsConformToFromStoryBoard  = NSClassFromString("\(module).\(viewName)") as? IMvvmFromStoryBoardAttribute.Type
        storyboardName = viewControllerIsConformToFromStoryBoard?.fromStoryboardName ?? storyboardName
        // Init and start ViewModel
        let newViewModel = viewModel.init()
        if mustStart == true {
            newViewModel.startViewModel(parameters: withParameters)
        }
        // Init View
        var newViewController = getViewControllerIfExist(storyboardName: storyboardName, identifier: viewName)
        if newViewController == nil {
            if let viewControllerIsConformToView  = NSClassFromString("\(module).\(viewName)") as? IMvvmView.Type {
                newViewController = viewControllerIsConformToView.init() as? UIViewController
            }
        }
        // Store ViewModel in View
        (newViewController as? IMvvmView)!.viewModelObject = newViewModel
        return (newViewController)!
    }

    static private func getViewControllerIfExist(storyboardName: String, identifier: String?) -> UIViewController? {
        var resultVC: UIViewController?
        do {
            try ObjC.catchException {
                let storyBoard = UIStoryboard(name: storyboardName, bundle: nil)
                if let identifier = identifier {
                    resultVC = storyBoard.instantiateViewController(withIdentifier: identifier)
                } else {
                    resultVC = storyBoard.instantiateInitialViewController()
                }
            }
        } catch {
            print("ViewController not found [\(storyboardName) - \(identifier ?? "Initial")]")
        }
        return (resultVC)
    }
}

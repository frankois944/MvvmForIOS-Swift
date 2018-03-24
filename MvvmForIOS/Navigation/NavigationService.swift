//
//  NavigationService.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit
import LGSideMenuController

class NavigationService: INavigationService {
    private var modalViewController:UIViewController?
    private let sideNavigator:LGSideMenuController = LGSideMenuController()
    public weak var window:UIWindow?
    init(window:UIWindow) {
        NSLog("[MvvmForIOS]Load NavigationService")
        self.window = window
    }
    
    var navigation:LGSideMenuController {
        get
        {
            return (sideNavigator)
        }
    }
    
    func setCenterViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void {
        let view = getView(viewModel: viewModelToShow, withParameters: nil)
        sideNavigator.rootViewController = UINavigationController(rootViewController: view)
        window?.rootViewController = sideNavigator
        window?.makeKeyAndVisible()
    }
    
    func showViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void {
        showViewModel(viewModelToShow: viewModelToShow, onCompletion:nil, withParameters: nil)
    }
    
    func showViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?) -> Void {
        showViewModel(viewModelToShow: viewModelToShow, onCompletion:onCompletion, withParameters: nil)
    }
    
    func showViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?, withParameters:AnyObject?) -> Void {
        let view = getView(viewModel: viewModelToShow, withParameters: withParameters)
        
        if ((view as? ILeftPanelAttribute) != nil) {
            if ((view as? IRootAttribute) != nil) {
                sideNavigator.leftViewController = UINavigationController(rootViewController: view)
                if (onCompletion != nil) {
                    onCompletion!()
                }
            }
            else {
                CATransaction.begin()
                CATransaction.setCompletionBlock(onCompletion)
                (sideNavigator.leftViewController as! UINavigationController).pushViewController(view, animated: getIsAnimatedForOpen(view: view))
                CATransaction.commit()
            }
        }
        else if ((view as? ILeftPanelAttribute) != nil) {
            if ((view as? IRootAttribute) != nil) {
                sideNavigator.rightViewController = UINavigationController(rootViewController: view)
                if (onCompletion != nil) {
                    onCompletion!()
                }
            }
            else {
                CATransaction.begin()
                CATransaction.setCompletionBlock(onCompletion)
                (sideNavigator.rightViewController as! UINavigationController).pushViewController(view, animated: getIsAnimatedForOpen(view: view))
                CATransaction.commit()
            }
        }
        else {
            if ((view as? IRootAttribute) != nil) {
                sideNavigator.rootViewController = UINavigationController(rootViewController: view)
                if (onCompletion != nil) {
                    onCompletion!()
                }
            }
            else {
                CATransaction.begin()
                CATransaction.setCompletionBlock(onCompletion)
                (sideNavigator.rootViewController as! UINavigationController).pushViewController(view, animated: getIsAnimatedForOpen(view: view))
                CATransaction.commit()
            }
        }
    }
    
    func showModalViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void {
        showModalViewModel(viewModelToShow: viewModelToShow, onCompletion:nil, customizeModal: nil, withParameters: nil)
    }
    
    func showModalViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?) -> Void {
        showModalViewModel(viewModelToShow: viewModelToShow, onCompletion:onCompletion, customizeModal: nil, withParameters: nil)
    }
    
    func showModalViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?, customizeModal:((UIViewController) -> (Void))?) -> Void {
        showModalViewModel(viewModelToShow: viewModelToShow, onCompletion:onCompletion, customizeModal:customizeModal, withParameters: nil)
    }
    
    func showModalViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?, customizeModal:((UIViewController) -> (Void))?, withParameters:AnyObject?) -> Void {
        if (modalViewController != nil) {
            NSLog("Must have only one Modal View")
        }
        else {
            modalViewController = getView(viewModel: viewModelToShow, withParameters: withParameters)
            if (customizeModal != nil && modalViewController != nil) {
                customizeModal!(modalViewController!)
            }
            (sideNavigator.rootViewController as! UINavigationController).topViewController?.present(modalViewController!, animated: getIsAnimatedForOpen(view: modalViewController), completion: onCompletion)
        }
    }
    
    func setRightSideViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void {
        let view = getView(viewModel: viewModelToShow, withParameters: nil)
        sideNavigator.rightViewController = UINavigationController(rootViewController: view)
    }
    
    func setLeftSideViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void {
        let view = getView(viewModel: viewModelToShow, withParameters: nil)
        sideNavigator.leftViewController = UINavigationController(rootViewController: view)
    }
    
    func closeViewModel<T:IBaseViewModel>(viewModelToClose:T!) -> Void {
        closeViewModel(viewModelToClose: viewModelToClose, onCompletion:nil)
    }
    
    func closeViewModel<T:IBaseViewModel>(viewModelToClose:T!, onCompletion:(() -> (Void))?) -> Void {
        CATransaction.begin()
        CATransaction.setCompletionBlock(onCompletion)
        
        if (modalViewController != nil) {
            modalViewController?.dismiss(animated: getIsAnimatedForClose(view: modalViewController), completion: nil)
            modalViewController = nil
        }
        else if (isViewModelExistInNavigation(viewModelToClose: viewModelToClose, navigationController: sideNavigator.leftViewController as? UINavigationController) != nil) {
            (sideNavigator.leftViewController as! UINavigationController).popViewController(animated: true)
        }
        else if (isViewModelExistInNavigation(viewModelToClose: viewModelToClose, navigationController: sideNavigator.rightViewController as? UINavigationController) != nil) {
            (sideNavigator.rightViewController as! UINavigationController).popViewController(animated: true)
        }
        else if (isViewModelExistInNavigation(viewModelToClose: viewModelToClose, navigationController: sideNavigator.rootViewController as? UINavigationController) != nil) {
            (sideNavigator.rootViewController as! UINavigationController).popViewController(animated: true)
        }
        else {
            NSLog("[MvvmForIOS]No View Found or is RootView for %@", String(describing: type(of: viewModelToClose!)))
        }
        CATransaction.commit()
    }
    
    func resolveViewModel<T>(viewModelToGet: T.Type!) -> T! where T : IBaseViewModel {
        let newViewModel = viewModelToGet.init()
        newViewModel.startViewModel(parameters: nil)
        return (newViewModel)
    }
    
    func showLeftPanel(animated:Bool) -> Void {
        animated == true ? sideNavigator.showLeftViewAnimated() : sideNavigator.showLeftView()
    }
    
    func showRightPanel(animated:Bool) -> Void {
        animated == true ? sideNavigator.showRightViewAnimated() : sideNavigator.showRightView()
    }
    
    func hideLeftPanel(animated:Bool) -> Void {
        animated == true ? sideNavigator.hideLeftViewAnimated() : sideNavigator.hideLeftView()
    }
    
    func hideRightPanel(animated:Bool) -> Void {
        animated == true ? sideNavigator.hideRightViewAnimated() : sideNavigator.hideRightView()
    }
    
    private func getView<T:IBaseViewModel>(viewModel:T.Type!, withParameters:AnyObject?) -> UIViewController {
        let classname = NSStringFromClass(viewModel as! AnyClass) as String
        let module = classname.components(separatedBy: ".").first!
        
        // getting view name
        let shortClassname = classname.replacingOccurrences(of: module+".", with: "")
        let storyboardName = shortClassname.replacingOccurrences(of: "ViewModel", with: "")
        let viewName = shortClassname.replacingOccurrences(of: "Model", with: "")
        
        // Init and start ViewModel
        let newViewModel = viewModel.init()
        newViewModel.startViewModel(parameters: withParameters)
        
        // Init View
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let newViewController = storyboard.instantiateViewController(withIdentifier: viewName) as! BaseView<T>
        
        // Store ViewModel in View
        newViewController.viewModel = newViewModel
        return (newViewController)
    }
    
    private func isViewModelExistInNavigation<T:IBaseViewModel>(viewModelToClose:T!, navigationController:UINavigationController?) -> UIViewController? {
        if (navigationController != nil) {
            let views = navigationController?.viewControllers
            if (views != nil && views!.count > 1) {
                for view in views! {
                    guard let viewToTest = view as? BaseView<T> else {
                        continue
                    }
                    if (Unmanaged.passUnretained(viewToTest.viewModel as AnyObject).toOpaque() == Unmanaged.passUnretained(viewModelToClose as AnyObject).toOpaque())  {
                        return (view)
                    }
                }
            }
        }
        return (nil)
    }
    
    private func getIsAnimatedForOpen(view:UIViewController!) -> Bool {
        var animated:Bool = true
        let viewToTest = view as? ITransitionAttribute
        if (viewToTest != nil) {
            animated = (viewToTest?.isOpenTransitionAnimated)!
        }
        return (animated)
    }
    
    private func getIsAnimatedForClose(view:UIViewController!) -> Bool {
        var animated:Bool = true
        let viewToTest = view as? ITransitionAttribute
        if (viewToTest != nil) {
            animated = (viewToTest?.isCloseTransitionAnimated)!
        }
        return (animated)
    }
}


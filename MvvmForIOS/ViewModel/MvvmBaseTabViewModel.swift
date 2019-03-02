//
//  BaseTabViewModel.swift
//  MvvmForIOSSwift
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import Foundation
import UIKit.UITabBarController

open class MvvmBaseTabViewModel: MvvmBaseViewModel, IMvvmBaseTabView {
    internal weak var tabCtr: UITabBarController! {
        didSet {
            setTabsWithStoredViewController()
        }
    }
    private var tabs: [UIViewController]?
    private var animated = false

    /**
     *  Set the tabViews for the current TabViewController
     *
     *  - parameters:
     *      - arrayOfViewModelsToAdd: A array of class which implements MvvmBaseViewModel
     *      - animated: animated or not
     */
    open func setTabs<T: MvvmBaseViewModel>(arrayOfViewModelsToAdd: [T.Type], animated: Bool) {
        let viewControllers = self.navigation.associateViewControllersWithViewModels(viewModels: arrayOfViewModelsToAdd)
        self.tabs = viewControllers
        self.animated = animated
        self.setTabsWithStoredViewController()
    }

    func setTabsWithStoredViewController() {
        if let tabCtr = tabCtr, let tabs = tabs {
            tabCtr.setViewControllers(tabs, animated: animated)
            if let viewModel = (tabCtr.selectedViewController as? IMvvmView)?.viewModelObject as? MvvmBaseViewModel {
                if viewModel.started == false {
                    viewModel.startViewModel(parameters: nil)
                    viewModel.started = true
                }
            }
        }
    }
}

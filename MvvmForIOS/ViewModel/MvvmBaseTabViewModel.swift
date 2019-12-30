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
    private var tabs = [UIViewController]()
    private var animated = false
    /**
     *  Set the tabViews for the current TabViewController
     *
     *  - parameters:
     *      - arrayOfViewModelsToAdd: A array of class which implements MvvmBaseViewModel
     *      - animated: animated or not
     */
    open func setTab(viewModelToShow: MvvmBaseViewModel.Type, at index: Int, animated: Bool = false) {
        let viewContoller = self.navigation.associateViewControllerForViewModel(viewModel: viewModelToShow)
        assert(viewContoller != nil, "The viewcontroller cant be nil \(viewModelToShow)")
        self.tabs.insert(viewContoller!, at: index)
        self.animated = animated
        self.setTabsWithStoredViewController()
    }
    /**
     *  Remove a specific tab
     *
     *  - parameters:
     *      - arrayOfViewModelsToAdd: A array of class which implements MvvmBaseViewModel
     *      - animated: animated or not
     */
    open func removeTab(at index: Int, animated: Bool = false) {
        if let tabCtr = tabCtr {
            var tabs = tabCtr.viewControllers
            tabs?.remove(at: index)
            tabCtr.setViewControllers(tabs, animated: animated)
        }
    }

    private func setTabsWithStoredViewController() {
        tabCtr?.setViewControllers(tabs, animated: animated)
    }
}

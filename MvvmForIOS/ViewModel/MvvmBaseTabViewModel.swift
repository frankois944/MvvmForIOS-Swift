//
//  BaseTabViewModel.swift
//  MvvmForIOSSwift
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import Foundation
import UIKit.UITabBarController

class MvvmBaseTabViewModel: MvvmBaseViewModel, IMvvmBaseTabView {
    internal weak var tabCtr: UITabBarController!

    open func setTabs<T: IMvvmBaseViewModel>(arrayOfViewModelsToAdd: [T.Type], animated: Bool) {
        let viewControllers = self.navigation.associateViewControllersWithViewModels(viewModels: arrayOfViewModelsToAdd)
        tabCtr.setViewControllers(viewControllers, animated: animated)
    }
}

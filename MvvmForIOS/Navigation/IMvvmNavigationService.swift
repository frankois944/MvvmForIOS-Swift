//
//  INavigationService.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit
import LGSideMenuController

public protocol IMvvmNavigationService {
    var baseNavigation: LGSideMenuController { get }

    func setCenterViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func setRightSideViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func setLeftSideViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)

    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                              onCompletion:(() -> Void)?)
    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                              onCompletion:(() -> Void)?,
                                              withParameters: AnyObject?)

    func showModalViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func showModalViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                                   onCompletion:(() -> Void)?)
    func showModalViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                                   onCompletion:(() -> Void)?,
                                                   customizeModal: ((UIViewController) -> Void)?)
    func showModalViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                                   onCompletion:(() -> Void)?,
                                                   customizeModal: ((UIViewController) -> Void)?,
                                                   withParameters: AnyObject?)

    func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T, onCompletion:(() -> Void)?)
    func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T)

    func showLeftPanel(animated: Bool)
    func showRightPanel(animated: Bool)
    func hideLeftPanel(animated: Bool)
    func hideRightPanel(animated: Bool)

    func resolveViewModel<T: IMvvmBaseViewModel>(viewModelToGet: T.Type) -> T
    func associateViewControllersWithViewModels<T: IMvvmBaseViewModel>(viewModels: [T.Type]) -> [UIViewController]?
}

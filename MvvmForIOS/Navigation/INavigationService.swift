//
//  INavigationService.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit
import LGSideMenuController

public protocol INavigationService {
    var navigation: LGSideMenuController { get }

    func setCenterViewModel<T: IBaseViewModel>(viewModelToShow: T.Type)
    func setRightSideViewModel<T: IBaseViewModel>(viewModelToShow: T.Type)
    func setLeftSideViewModel<T: IBaseViewModel>(viewModelToShow: T.Type)

    func showViewModel<T: IBaseViewModel>(viewModelToShow: T.Type)
    func showViewModel<T: IBaseViewModel>(viewModelToShow: T.Type,
                                          onCompletion:(() -> Void)?)
    func showViewModel<T: IBaseViewModel>(viewModelToShow: T.Type,
                                          onCompletion:(() -> Void)?,
                                          withParameters: AnyObject?)

    func showModalViewModel<T: IBaseViewModel>(viewModelToShow: T.Type)
    func showModalViewModel<T: IBaseViewModel>(viewModelToShow: T.Type,
                                               onCompletion:(() -> Void)?)
    func showModalViewModel<T: IBaseViewModel>(viewModelToShow: T.Type,
                                               onCompletion:(() -> Void)?,
                                               customizeModal: ((UIViewController) -> Void)?)
    func showModalViewModel<T: IBaseViewModel>(viewModelToShow: T.Type,
                                               onCompletion:(() -> Void)?,
                                               customizeModal: ((UIViewController) -> Void)?,
                                               withParameters: AnyObject?)

    func closeViewModel<T: IBaseViewModel>(viewModelToClose: T, onCompletion:(() -> Void)?)
    func closeViewModel<T: IBaseViewModel>(viewModelToClose: T)

    func showLeftPanel(animated: Bool)
    func showRightPanel(animated: Bool)
    func hideLeftPanel(animated: Bool)
    func hideRightPanel(animated: Bool)

    func resolveViewModel<T: IBaseViewModel>(viewModelToGet: T.Type) -> T
}

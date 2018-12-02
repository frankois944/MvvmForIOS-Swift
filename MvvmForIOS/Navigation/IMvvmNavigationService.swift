//
//  INavigationService.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

public protocol IMvvmNavigationService {
    var baseNavigation: UINavigationController { get }

    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                              onCompletion:(() -> Void)?)
    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                              onCompletion:(() -> Void)?,
                                              withParameters: Any?)

    func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T, onCompletion:(() -> Void)?)
    func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T)

    func resolveViewModel<T: IMvvmBaseViewModel>(viewModelToGet: T.Type) -> T
    func associateViewControllersWithViewModels<T: IMvvmBaseViewModel>(viewModels: [T.Type]) -> [UIViewController]?
}

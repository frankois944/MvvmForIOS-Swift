//
//  NavigationService.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit
import MvvmForIOSSwift_Private

open class MvvmNavigationService: IMvvmNavigationService {

    private let presenter: IMvvmPresenter!

    public init(presenter: IMvvmPresenter) {
        NSLog("[MvvmForIOS]Load NavigationService")
        self.presenter = presenter
    }

    public var baseNavigation: UIViewController {
        return (presenter.navigationController)
    }

    public func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type) {
        showViewModel(viewModelToShow: viewModelToShow, onCompletion: nil, withParameters: nil)
    }

    public func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type, onCompletion:(() -> Void)?) {
        showViewModel(viewModelToShow: viewModelToShow, onCompletion: onCompletion, withParameters: nil)
    }

    public func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type, onCompletion:(() -> Void)?, withParameters: Any?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(onCompletion)
        presenter.show(request: MvvmRequest(viewModel: viewModelToShow, parameters: withParameters, customizeTransition: nil))
        CATransaction.commit()
    }

    public func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T, onCompletion:(() -> Void)?) {
        CATransaction.begin()
        CATransaction.setCompletionBlock(onCompletion)
        presenter.close(viewModel: viewModelToClose)
        CATransaction.commit()
    }

    public func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T) {
        closeViewModel(viewModelToClose: viewModelToClose, onCompletion: nil)
    }

    public func resolveViewModel<T>(viewModelToGet: T.Type) -> T where T: IMvvmBaseViewModel {
        let newViewModel = viewModelToGet.init()
        newViewModel.startViewModel(parameters: nil)
        return (newViewModel)
    }

    public func associateViewControllersWithViewModels<T: IMvvmBaseViewModel>(viewModels: [T.Type]) -> [UIViewController]? {
        let result = viewModels.map {
            return (MvvmNavigationUtility.getView(viewModel: $0, withParameters: nil, mustStart: false))
        }
        return (result)
    }
}

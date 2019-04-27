//
//  MvvmRquest.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 17/11/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

/**
 *
 */
public struct MvvmRequest<T: IMvvmBaseViewModel> {
    public let viewModel: T.Type
    public let view: UIViewController
    public let parameters: Any?
    public let customizeModalTransition: ((UIViewController) -> Void)?
    public let presenterParamters: [String: Any]?

    init(viewModel: T.Type, container: IMvvmContainer, parameters: Any?) {
        self.viewModel = viewModel
        self.view = container.getView(viewModel: viewModel)
        self.parameters = parameters
        self.customizeModalTransition = nil
        self.presenterParamters = nil
    }

    init(viewModel: T.Type, container: IMvvmContainer, parameters: Any?, customizeTransition: ((UIViewController) -> Void)? = nil) {
        self.viewModel = viewModel
        self.view = container.getView(viewModel: viewModel)
        self.parameters = parameters
        self.customizeModalTransition = customizeTransition
        self.presenterParamters = nil
    }
}

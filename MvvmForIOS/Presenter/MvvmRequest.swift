//
//  MvvmRquest.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 17/11/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

public struct MvvmRequest<T: IMvvmBaseViewModel> {
    let viewModel: T.Type
    let parameters: Any?
    let customizeModalTransition: ((UIViewController) -> Void)?
    let presenterParamters: [String: Any]?

    init(viewModel: T.Type, parameters: Any?) {
        self.viewModel = viewModel
        self.parameters = parameters
        self.customizeModalTransition = nil
        self.presenterParamters = nil
    }

    init(viewModel: T.Type, parameters: Any?, customizeTransition: ((UIViewController) -> Void)? = nil) {
        self.viewModel = viewModel
        self.parameters = parameters
        self.customizeModalTransition = customizeTransition
        self.presenterParamters = nil
    }
}

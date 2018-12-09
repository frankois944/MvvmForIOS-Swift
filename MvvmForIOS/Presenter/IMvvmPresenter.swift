//
//  IPresenter.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 17/11/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

public protocol IMvvmPresenter {

    init(window: UIWindow)

    var navigationController: UIViewController { get }

    func show<T: IMvvmBaseViewModel>(request: MvvmRequest<T>)
    func close<T: IMvvmBaseViewModel>(viewModel: T)
}

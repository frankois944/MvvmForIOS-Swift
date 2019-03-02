//
//  IPresenter.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 17/11/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

/**
 * A presenter is use when the app asked for navigate to another view
 */
public protocol IMvvmPresenter {
    /**
     * Init of the presenter
     */
    init(window: UIWindow)
    /**
     * The current navigation controller
     */
    var navigationController: UIViewController { get }

    /**
     * Called when asking to navigate to another view
     */
    func show<T: IMvvmBaseViewModel>(request: MvvmRequest<T>)
    /**
     * Called when asking closing a view
     */
    func close<T: IMvvmBaseViewModel>(viewModel: T)
}

//
//  MvvmBaseTableView.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 22/07/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

/**
 *
 */
open class MvvmBaseTableView<T: IMvvmBaseViewModel>: UITableViewController, IMvvmBaseView {

    var viewModelObject: Any? {
        get { return viewModel }
        set { viewModel = newValue as? T }
    }

    lazy open var viewModel: T! = {
        let newViewModel = (T.self).init()
        return newViewModel
    }()

    override open func viewDidLoad() {
        super.viewDidLoad()
        viewModel.startViewModel(parameters: viewModel.parameters)
        viewModel.parameters = nil
    }

    open override func didMove(toParent parent: UIViewController?) {
        // clean viewModel
        super.didMove(toParent: parent)
        if parent == nil {
            (viewModel as? IMvvmVisibility)?.cleanUp()
        }
    }
}

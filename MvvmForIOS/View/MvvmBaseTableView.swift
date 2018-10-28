//
//  MvvmBaseTableView.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 22/07/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

open class MvvmBaseTableView<T: IMvvmBaseViewModel> : UITableViewController, IMvvmBaseView {
    typealias ViewModelType = T
    open var viewModel: T!

    internal var typeOfViewModel: AnyClass? = T.self as? AnyClass
    internal var viewModelObject: Any? {
        get {
            return (viewModel as Any?)
        }
        set {
            viewModel = newValue as? T
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        loadViewModelForCurrent()
    }

    fileprivate func loadViewModelForCurrent() {
        if viewModelObject == nil {
            if let type = viewModel as? MvvmBaseViewModel.Type {
                let instance = type.init()
                instance.startViewModel(parameters: nil)
                viewModelObject = instance
            }
        }
    }

    open override func didMove(toParent parent: UIViewController?) {
        // clean viewModel
        super.didMove(toParent: parent)
        if parent == nil {
            (viewModel as? IMvvmVisibility)?.isDestroyed()
            viewModel = nil
        }
    }
}

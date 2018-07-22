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
    internal var viewModelObject: AnyObject? {
        get {
            return (viewModel as AnyObject?)
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
            let instance = (typeOfViewModel as? MvvmBaseViewModel.Type)!.init()
            instance.startViewModel(parameters: nil)
            viewModelObject = instance
        }
    }
}

//
//  BaseViewController.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

open class BaseView<T: IBaseViewModel> : UIViewController, IBaseView {
    typealias ViewModelType = T
    open var viewModel: T!
    open var fromStoryboardName: String? {
        return (nil)
    }

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
        if viewModelObject == nil {
            let instance = (typeOfViewModel as? BaseViewModel.Type)!.init()
            instance.startViewModel(parameters: nil)
            viewModelObject = instance
        }
        // Do any additional setup after loading the view.
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        (viewModel as? IVisibility)?.isVisible(isVisible: true)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        (viewModel as? IVisibility)?.isVisible(isVisible: false)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (viewModel as? IVisibility)?.willBeVisible(willBeVisible: true)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        (viewModel as? IVisibility)?.willBeVisible(willBeVisible: false)
    }

    deinit {
    }

    open override func didMove(toParentViewController parent: UIViewController?) {
        // clean viewModel
        if parent == nil {
            viewModel = nil
        }
    }
}

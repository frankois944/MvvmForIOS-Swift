//
//  BaseViewController.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

/**
 *
 */
open class MvvmBaseView<T: IMvvmBaseViewModel> : UIViewController, IMvvmBaseView {
    typealias ViewModelType = T
    open var viewModel: T!

    internal var typeOfViewModel: AnyClass? = T.self as? AnyClass
    internal var viewModelObject: Any? {
        get {
            return (viewModel as Any?)
        }
        set {
            viewModel = (newValue as? T)!
        }
    }

    override open func viewDidLoad() {
        super.viewDidLoad()
        loadViewModelForCurrent()
        // Do any additional setup after loading the view.
    }

    fileprivate func loadViewModelForCurrent() {
        if viewModelObject == nil {
            let instance = (typeOfViewModel as? MvvmBaseViewModel.Type)!.init()
            instance.startViewModel(parameters: nil)
            viewModelObject = instance
        }
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        (viewModel as? IMvvmVisibility)?.isVisible(isVisible: true)
    }

    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        (viewModel as? IMvvmVisibility)?.isVisible(isVisible: false)
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        (viewModel as? IMvvmVisibility)?.willBeVisible(willBeVisible: true)
    }

    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        (viewModel as? IMvvmVisibility)?.willBeVisible(willBeVisible: false)
    }

    deinit {
    }

    open override func didMove(toParent parent: UIViewController?) {
        // clean viewModel
        super.didMove(toParent: parent)
        if parent == nil {
            (viewModel as? IMvvmVisibility)?.cleanUp()
            viewModel = nil
        }
    }
}

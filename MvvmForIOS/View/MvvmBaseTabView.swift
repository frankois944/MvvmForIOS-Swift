//
//  BasetabView.swift
//  MvvmForIOSSwift
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

/**
 *
 */
open class MvvmBaseTabView<T: IMvvmBaseViewModel>: UITabBarController, UITabBarControllerDelegate, IMvvmBaseView {
    var viewModelObject: Any? {
        get {
            return viewModel
        }
        set {
            viewModel = newValue as? T
        }
    }

    lazy open var viewModel: T! = {
        let newViewModel = (T.self).init()
        return newViewModel
    }()

    override open func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        (viewModel as? IMvvmBaseTabView)?.tabCtr = self
        viewModel.startViewModel(parameters: viewModel.parameters)
        viewModel.parameters = nil
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

    open override func didMove(toParent parent: UIViewController?) {
        // clean viewModel
        super.didMove(toParent: parent)
        if parent == nil {
            viewControllers?.forEach {  $0.didMove(toParent: parent) }
            (viewModel as? IMvvmVisibility)?.cleanUp()
        }
    }
}

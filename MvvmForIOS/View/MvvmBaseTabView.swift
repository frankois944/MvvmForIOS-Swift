//
//  BasetabView.swift
//  MvvmForIOSSwift
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

open class MvvmBaseTabView<T: IMvvmBaseViewModel> : UITabBarController, UITabBarControllerDelegate, IMvvmBaseView {
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
        self.delegate = self
        if let viewControllers = viewControllers, viewControllers.count > 0 {
            let viewController = viewControllers[0]
            if let viewController = viewController as? IMvvmView {
                initViewModelIfnecessary(viewController: viewController)
            }
        }
        (viewModel as? IMvvmBaseTabView)?.tabCtr = self
        // Do any additional setup after loading the view.
    }

    public func tabBarController(_ tabBarController: UITabBarController,
                                 shouldSelect viewController: UIViewController) -> Bool {
        initViewModelIfnecessary(viewController: (viewController as? IMvvmView)!)
        return (true)
    }

    fileprivate func initViewModelIfnecessary(viewController: IMvvmView) {
        if viewController.viewModelObject == nil, let type = viewController.typeOfViewModel as? MvvmBaseViewModel.Type {
            let instance = type.init()
            instance.startViewModel(parameters: nil)
            viewController.viewModelObject = instance
        }
        if let viewModel = viewController.viewModelObject as? MvvmBaseViewModel {
            if viewModel.started == false {
                viewModel.startViewModel(parameters: nil)
                viewModel.started = true
            }
        }
    }

    fileprivate func loadViewModelForCurrent() {
        if viewModelObject == nil {
            if let type = typeOfViewModel as? MvvmBaseViewModel.Type {
                let instance = type.init()
                instance.startViewModel(parameters: nil)
                viewModelObject = instance
            }
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
            viewControllers?.forEach {  $0.didMove(toParent: parent) }
            (viewModel as? IMvvmVisibility)?.isDestroyed()
            viewModel = nil
        }
    }
}

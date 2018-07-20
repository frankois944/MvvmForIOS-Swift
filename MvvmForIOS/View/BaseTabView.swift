//
//  BasetabView.swift
//  MvvmForIOSSwift
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

open class BaseTabView<T: IBaseViewModel> : UITabBarController, UITabBarControllerDelegate, IBaseView {
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
        self.delegate = self
        if viewControllers != nil {
            let viewController = viewControllers![0]
            initViewModelIfnecessary(viewController: (viewController as? IView)!)
        }
        // Do any additional setup after loading the view.
    }

    public func tabBarController(_ tabBarController: UITabBarController,
                                 shouldSelect viewController: UIViewController) -> Bool {
        initViewModelIfnecessary(viewController: (viewController as? IView)!)
        return (true)
    }

    fileprivate func initViewModelIfnecessary(viewController: IView) {
        if viewController.viewModelObject == nil {
            let instance = (viewController.typeOfViewModel as? BaseViewModel.Type)!.init()
            instance.startViewModel(parameters: nil)
            viewController.viewModelObject = instance
        }
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

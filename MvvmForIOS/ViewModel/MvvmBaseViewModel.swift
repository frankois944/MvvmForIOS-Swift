//
//  BaseViewModel.swift
//  MvvmForIOS
//
//  Created by Dabonot Francois on 04/01/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import Foundation

open class MvvmBaseViewModel: IMvvmBaseViewModel, IMvvmVisibility {
    public var parameters: Any?
    /**
     *
     */
    public var navigation: IMvvmNavigationService {
        return (MvvmServiceLocator.resolve()!)
    }
    /**
     * 
     */
    required public init() {
    }
    /**
     *
     */
    open func startViewModel(parameters: Any?) {
    }
    /**
     *
     */
    open func willBeVisible(willBeVisible: Bool) {
    }
    /**
     *
     */
    open func isVisible(isVisible: Bool) {
    }
    /**
     *
     */
    open func cleanUp() {
    }
}

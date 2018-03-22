//
//  BaseViewModel.swift
//  MvvmForIOS
//
//  Created by Dabonot Francois on 04/01/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import Foundation

open class BaseViewModel : IBaseViewModel, IVisibility {
    
    open lazy var navigation:INavigationService! = ServiceLocator.resolve()
    
    required public init() {
    }
    
    deinit {
    }
    
    open func startViewModel(parameters: Any?) {
    }
    
    open func willBeVisible(willBeVisible:Bool) -> Void {
    }
    
    open func isVisible(IsVisible:Bool) -> Void {
    }
}

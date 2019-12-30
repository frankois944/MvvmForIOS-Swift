//
//  TabBarViewModel.swift
//  MvvmForIOS-Sample
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import MvvmForIOSSwift
import Foundation

class TabBarViewModel: MvvmBaseTabViewModel {

    required init() {
        super.init()
        setTab(viewModelToShow: Tab1BarViewModel.self, at: 0)
        setTab(viewModelToShow: Tab2BarViewModel.self, at: 1)
        setTab(viewModelToShow: Tab3BarViewModel.self, at: 2)
    }

    override func startViewModel(parameters: Any?) {
        NSLog("[startViewModel] \(String(describing: self))")
    }

    override func cleanUp() {
        super.cleanUp()
        NSLog("[isDestroyed] \(String(describing: self))")
    }

    deinit {
        NSLog("[deinit] \(String(describing: self))")
    }
}

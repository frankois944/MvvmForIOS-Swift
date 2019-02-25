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
        self.setTabs(arrayOfViewModelsToAdd: [Tab1BarViewModel.self, Tab2BarViewModel.self, Tab3BarViewModel.self], animated: true)
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

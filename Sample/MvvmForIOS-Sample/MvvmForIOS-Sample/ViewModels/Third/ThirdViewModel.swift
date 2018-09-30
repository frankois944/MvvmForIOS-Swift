//
//  ThirdViewModel.swift
//  MvvmForIOS-Sample
//
//  Created by Francois Dabonot on 20/07/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import MvvmForIOSSwift
import Foundation

class ThirdViewModel: MvvmBaseViewModel {

    override func startViewModel(parameters: Any?) {
        NSLog("[startViewModel] \(String(describing: self))")
    }

    override func isDestroyed() {
        super.isDestroyed()
        NSLog("[isDestroyed] \(String(describing: self))")
    }

    deinit {
        NSLog("[deinit] \(String(describing: self))")
    }
}

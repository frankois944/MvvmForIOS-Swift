//
//  ModalViewModel.swift
//  MvvmForIOS-Sample
//
//  Created by Francois Dabonot on 18/11/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import Foundation
import MvvmForIOSSwift

class ModalViewModel: MvvmBaseViewModel {
    func closeViewModel() {
        navigation.closeViewModel(viewModelToClose: self)
    }

    deinit {
        NSLog("[deinit] \(String(describing: self))")
    }
}

//
//  SecondViewModel.swift
//  MvvmForIOSSwift-Sample
//
//  Created by Dabonot Francois on 22/03/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

class SecondViewModel: MvvmBaseViewModel {
    let service: IDataService! = MvvmServiceLocator.resolve()

    override func startViewModel(parameters: Any?) {

    }
}

//
//  SecondViewModel.swift
//  MvvmForIOS-Sample
//
//  Created by Dabonot Francois on 22/03/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOS

class SecondViewModel: BaseViewModel {
    let service:IDataService! = ServiceLocator.resolve()

    override func startViewModel(parameters: Any?) {
        
    }
}
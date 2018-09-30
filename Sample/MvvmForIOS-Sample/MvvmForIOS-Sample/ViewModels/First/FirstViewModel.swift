//
//  FirstViewModel.swift
//  MvvmForIOSSwift-Sample
//
//  Created by Dabonot Francois on 22/03/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

class FirstViewModel: MvvmBaseViewModel {

    let service: IDataService! = MvvmServiceLocator.resolve()

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

    func showSecondViewModel() {
        navigation.showViewModel(viewModelToShow: SecondViewModel.self)
        //navigation.showViewModel(viewModelToShow: SecondViewModel.self, onCompletion: nil, withParameters: nil)
    }

    func showThirdViewModel() {
        navigation.showViewModel(viewModelToShow: ThirdViewModel.self)
        //navigation.showViewModel(viewModelToShow: SecondViewModel.self, onCompletion: nil, withParameters: nil)
    }

    func showTabViewModel() {
        navigation.showViewModel(viewModelToShow: TabBarViewModel.self)
        //navigation.showViewModel(viewModelToShow: SecondViewModel.self, onCompletion: nil, withParameters: nil)
    }

    func showLeftPanel() {
        navigation.showLeftPanel(animated: true)
    }

    func showRightPanel() {
        navigation.showRightPanel(animated: true)
    }

    func showTableViewModel() {
        navigation.showViewModel(viewModelToShow: TableViewModel.self)
    }
}

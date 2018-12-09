//
//  FirstViewModel.swift
//  MvvmForIOSSwift-Sample
//
//  Created by Dabonot Francois on 22/03/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOSSwift
//import MvvmForIOSSwift_SidePanel

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
        navigation.showViewModel(viewModelToShow: LeftSideViewModel.self, onCompletion: {
            print("Show LeftSideViewModel completed")
        }, withParameters: nil)
        //navigation.showLeftPanel(animated: true)
    }

    func showThirdViewModel() {
        navigation.showViewModel(viewModelToShow: RightSideViewModel.self, onCompletion: {
            print("Show RightSideViewModel completed")
        }, withParameters: nil)
        //navigation.showViewModel(viewModelToShow: SecondViewModel.self, onCompletion: nil, withParameters: nil)
    }

    func showTabViewModel() {
        navigation.showViewModel(viewModelToShow: TabBarViewModel.self, onCompletion: {
            print("Show RightSideViewModel completed")
        }, withParameters: nil)
        //navigation.showViewModel(viewModelToShow: SecondViewModel.self, onCompletion: nil, withParameters: nil)
    }

    func showLeftPanel() {
//        navigation.showLeftPanel(animated: true)
    }

    func showRightPanel() {
//        navigation.showRightPanel(animated: true)
    }

    func showTableViewModel() {
        navigation.showViewModel(viewModelToShow: TableViewModel.self, onCompletion: {
            print("Show TableViewModel completed")
        }, withParameters: nil)
    }

    func showModalViewModel() {
        navigation.showViewModel(viewModelToShow: ModalViewModel.self, onCompletion: {
            print("Show ModalViewModel completed")
        }, withParameters: nil)
    }
}

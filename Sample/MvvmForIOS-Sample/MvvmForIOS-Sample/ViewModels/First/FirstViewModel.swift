//
//  FirstViewModel.swift
//  MvvmForIOS-Sample
//
//  Created by Dabonot Francois on 22/03/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOS

class FirstViewModel: BaseViewModel {

    let service:IDataService! = ServiceLocator.resolve()
    
    override func startViewModel(parameters: Any?) {
        
    }
    
    func showSecondViewModel() -> Void {
        navigation.showViewModel(viewModelToShow: SecondViewModel.self)
        //navigation.showViewModel(viewModelToShow: SecondViewModel.self, onCompletion: nil, withParameters: nil)
    }
    
    
    func showLeftPanel() -> Void {
        navigation.showLeftPanel(animated: true)
    }
    
    func showRightPanel() -> Void {
        navigation.showRightPanel(animated: true)
    }
}

//
//  BaseTabViewModel.swift
//  MvvmForIOSSwift
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import Foundation

class BaseTabViewModel: BaseViewModel {
    open func addTabView<T: IBaseViewModel>(arrayOfViewModelsToAdd: [T.Type]) {
    }
}

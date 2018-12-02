//
//  MvvmBaseViewModel.swift
//  MvvmForIOSSwift.SidePanel
//
//  Created by Francois Dabonot on 02/12/2018.
//  Copyright © 2018 Francois Dabonot. All rights reserved.
//

import MvvmForIOSSwift

extension MvvmBaseViewModel {
    public var navigation: ISideMvvmNavigationService {
        return (MvvmServiceLocator.resolve()!)
    }
}

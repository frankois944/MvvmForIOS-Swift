//
//  UBaseView.swift
//  MvvmForIOSSwift
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import Foundation

protocol IBaseView {
    var typeOfViewModel: AnyClass? { get set }
    var viewModelObject: AnyObject? { get set }
}

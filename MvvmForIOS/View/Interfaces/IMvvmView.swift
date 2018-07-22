//
//  IView.swift
//  MvvmForIOSSwift
//
//  Created by Francois Dabonot on 15/07/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

internal protocol IMvvmView: class {
    init()
    var typeOfViewModel: AnyClass? { get set }
    var viewModelObject: AnyObject? { get set }
}

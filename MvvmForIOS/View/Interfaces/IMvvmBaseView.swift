//
//  UBaseView.swift
//  MvvmForIOSSwift
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

protocol IMvvmBaseView: IMvvmView {
    associatedtype ViewModelType
    var viewModel: ViewModelType! { get set }
}

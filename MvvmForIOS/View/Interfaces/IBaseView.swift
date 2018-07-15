//
//  UBaseView.swift
//  MvvmForIOSSwift
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

protocol IBaseView : IView {
    associatedtype ViewModelType
    var viewModel:ViewModelType! { get set }
}

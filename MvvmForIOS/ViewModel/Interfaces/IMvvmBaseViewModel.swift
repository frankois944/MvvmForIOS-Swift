//
//  IBaseViewModel.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import Foundation

public protocol IMvvmBaseViewModel {
    init()
    func startViewModel(parameters: Any?)
    var started: Bool {get set}
}

//
//  IVisibility.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

internal protocol IMvvmVisibility {
    func willBeVisible(willBeVisible: Bool)
    func isVisible(isVisible: Bool)
    func cleanUp()
}

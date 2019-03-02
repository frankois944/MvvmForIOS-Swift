//
//  IMvvmContainer.swift
//  MvvmForIOSSwift
//
//  Created by fdabonot on 26/12/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

/**
 * Used for getting the view
 */
public protocol IMvvmContainer {
	init()
    /**
     * From the viewModel, retrieve the wanted view
     */
	func getView<T: IMvvmBaseViewModel>(viewModel: T.Type) -> UIViewController
}

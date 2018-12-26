//
//  IMvvmContainer.swift
//  MvvmForIOSSwift
//
//  Created by fdabonot on 26/12/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

public protocol IMvvmContainer {
	func getView<T: IMvvmBaseViewModel>(viewModel: T.Type) -> UIViewController
}

//
//  IVisibility.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

protocol IVisibility {
    func willBeVisible(willBeVisible:Bool) -> Void
    func isVisible(IsVisible:Bool) -> Void
}

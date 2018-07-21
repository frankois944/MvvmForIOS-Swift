//
//  IPanelAttributes.swift
//  MvvmForIOS
//
//  Created by Dabonot Francois on 25/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

public protocol IMvvmLeftPanelAttribute {
}

public protocol IMvvmRightPanelAttribute {
}

public protocol IMvvmTransitionAttribute {
    var isOpenTransitionAnimated: Bool {get set}
    var isCloseTransitionAnimated: Bool {get set}
}

public protocol IMvvmFromStoryBoardAttribute {
    static var fromStoryboardName: String? {get}
}

public protocol IMvvmRootAttribute {
}

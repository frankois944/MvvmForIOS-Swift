//
//  IPannelAttributes.swift
//  MvvmForIOS
//
//  Created by Dabonot Francois on 25/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit

public protocol ILeftPannelAttribute {
}

public protocol IRightPannelAttribute {
}

public protocol ITransitionAttribute {
    var isOpenTransitionAnimated:Bool!  {get set}
    var isCloseTransitionAnimated:Bool! {get set}
}

public protocol IRootAttribute {
    
}






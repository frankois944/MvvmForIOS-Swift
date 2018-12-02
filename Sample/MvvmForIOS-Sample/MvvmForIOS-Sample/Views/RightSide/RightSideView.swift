//
//  ThirdView.swift
//  MvvmForIOS-Sample
//
//  Created by Francois Dabonot on 20/07/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

class RightSideView: MvvmBaseView<RightSideViewModel>, IMvvmRightPanelAttribute {

    var label: UILabel {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        lbl.text = "label from code"
        lbl.textAlignment = .center
        return (lbl)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(label)
        NSLog("[viewDidLoad] \(String(describing: self))")
    }

    deinit {
        NSLog("[deinit] \(String(describing: self))")
    }
}

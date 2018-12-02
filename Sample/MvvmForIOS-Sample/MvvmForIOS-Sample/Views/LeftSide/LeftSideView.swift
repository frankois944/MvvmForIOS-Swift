//
//  SecondView.swift
//  MvvmForIOSSwift-Sample
//
//  Created by Dabonot Francois on 22/03/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

class LeftSideView: MvvmBaseView<LeftSideViewModel>, IMvvmLeftPanelAttribute, IMvvmTransitionAttribute {

    var isOpenTransitionAnimated: Bool = false
    var isCloseTransitionAnimated: Bool = false

    @IBOutlet weak var contentToShowLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        contentToShowLabel.text = viewModel.service.someData
        NSLog("[viewDidLoad] \(String(describing: self))")
        // Do any additional setup after loading the view.
    }

    deinit {
        NSLog("[deinit] \(String(describing: self))")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

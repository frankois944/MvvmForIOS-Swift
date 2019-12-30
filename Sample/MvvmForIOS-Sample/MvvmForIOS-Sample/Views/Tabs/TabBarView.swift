//
//  TabBarView.swift
//  MvvmForIOS-Sample
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

class TabBarView: MvvmBaseTabView<TabBarViewModel> {

    override func viewDidLoad() {
        super.viewDidLoad()
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

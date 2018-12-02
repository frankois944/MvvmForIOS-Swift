//
//  ModalViewController.swift
//  MvvmForIOS-Sample
//
//  Created by Francois Dabonot on 18/11/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

class ModalView: MvvmBaseView<ModalViewModel>, IMvvmModalView {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closeView(_ sender: Any) {
        viewModel.closeViewModel()
    }

    deinit {
        NSLog("[deinit] \(String(describing: self))")
    }
}

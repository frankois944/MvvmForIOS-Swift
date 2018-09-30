//
//  Tab3BarView.swift
//  MvvmForIOS-Sample
//
//  Created by Dabonot Francois on 12/05/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

class Tab3BarView: MvvmBaseView<Tab3BarViewModel>, IMvvmFromStoryBoardAttribute {

    static var fromStoryboardName: String? {
        return ("TabBar")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        NSLog("[viewDidLoad] \(String(describing: self))")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        NSLog("[deinit] \(String(describing: self))")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

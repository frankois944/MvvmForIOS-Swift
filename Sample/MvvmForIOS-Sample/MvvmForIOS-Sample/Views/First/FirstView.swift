//
//  FirstView.swift
//  MvvmForIOSSwift-Sample
//
//  Created by Dabonot Francois on 22/03/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit
import MvvmForIOSSwift

class FirstView: MvvmBaseView<FirstViewModel>, IMvvmRootAttribute, IMvvmFromStoryBoardAttribute {

    static var fromStoryboardName: String? {
        return ("First")
    }

    @IBOutlet weak var contentText: UITextField!

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

    @IBAction func goSecondView(_ sender: Any) {
        viewModel.service.someData = contentText.text
        viewModel.showSecondViewModel()
    }

    @IBAction func goThirdView(_ sender: Any) {
        viewModel.showThirdViewModel()
    }

    @IBAction func goTabView(_ sender: Any) {
        viewModel.service.someData = contentText.text
        viewModel.showTabViewModel()
    }

    @IBAction func showLeftPanel(_ sender: Any) {
        viewModel.service.someData = contentText.text
        viewModel.showLeftPanel()
    }

    @IBAction func showRightPanel(_ sender: Any) {
        viewModel.service.someData = contentText.text
        viewModel.showRightPanel()
    }

    @IBAction func showTableViewCtr(_ sender: Any) {
        viewModel.showTableViewModel()
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

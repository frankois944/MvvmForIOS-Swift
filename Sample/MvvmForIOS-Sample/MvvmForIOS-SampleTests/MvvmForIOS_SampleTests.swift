//
//  MvvmForIOS_SampleTests.swift
//  MvvmForIOS-SampleTests
//
//  Created by Francois Dabonot on 01/10/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import XCTest
import MvvmForIOSSwift

class MvvmForIOSSampleTests: XCTestCase {

    let window = UIWindow(frame: UIScreen.main.bounds)
    var mvvmForIOSSwift: MvvmSetup!
    lazy var navigation: IMvvmNavigationService! = MvvmServiceLocator.resolve()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mvvmForIOSSwift = MvvmSetup(window: window, customNavigationController: UINavigationController.self)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testShowInitialViewModel() {
        //navigation.setCenterViewModel(viewModelToShow: FirstViewModel.self)
    }

    func testRegisterAndResolveService() {
        MvvmServiceLocator.register(service: DataService() as IDataService)
        let service: IDataService! = MvvmServiceLocator.resolve()
        XCTAssertNotNil(service)
        service.someData = "42"
        XCTAssertNotNil(service.someData)
    }

}

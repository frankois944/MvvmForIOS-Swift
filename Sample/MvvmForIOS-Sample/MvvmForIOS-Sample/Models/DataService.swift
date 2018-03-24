//
//  DataService.swift
//  MvvmForIOSSwift-Sample
//
//  Created by Dabonot Francois on 22/03/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//


class DataService: IDataService {
    private var _someData:String?
    var someData:String? {
        get {
            return (_someData)
        }
        set {
            _someData = newValue
        }
    }
}

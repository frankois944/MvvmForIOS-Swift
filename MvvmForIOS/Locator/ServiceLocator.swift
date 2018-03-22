//
//  ServiceLocator.swift
//  MvvmForIOS
//
//  Created by Dabonot Francois on 16/01/2018.
//  Copyright © 2018 Dabonot Francois. All rights reserved.
//

import UIKit

open class ServiceLocator: NSObject {
    
	private static let sharedInstance = ServiceLocator();
    private override init() {
        
    }

	private lazy var services: Dictionary<String, Any> = [:]
    
    private static func typeName(some: Any) -> String {
		return (some is Any.Type) ? "\(some)" : "\(type(of: some))";
    }
    
    open static func register<T>(service: T) {
		let key = typeName(some: T.self);
		ServiceLocator.sharedInstance.services[key] = service;
    }
    
    open static func resolve<T>() -> T? {
		let key = typeName(some: T.self);
		return ServiceLocator.sharedInstance.services[key] as? T;
    }
}

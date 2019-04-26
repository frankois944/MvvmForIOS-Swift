//
//  MvvmContainer.swift
//  MvvmForIOSSwift
//
//  Created by fdabonot on 26/12/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit
import MvvmForIOSSwift_Private

/**
 *
 */
open class MvvmBasicContainer: MvvmBaseContainer, IMvvmContainer {

	public func getView<T: IMvvmBaseViewModel>(viewModel: T.Type) -> UIViewController {
		let classname = NSStringFromClass((viewModel as? AnyClass)!)
		let module = classname.components(separatedBy: ".").first!
		// getting view name
		let shortClassname = classname.replacingOccurrences(of: module+".", with: "")
		var storyboardName = shortClassname.replacingOccurrences(of: "ViewModel", with: "")
		let viewName = shortClassname.replacingOccurrences(of: "Model", with: "")
		// getting the storyboardName from the associate view
		let viewControllerIsConformToFromStoryBoard = NSClassFromString("\(module).\(viewName)") as? IMvvmFromStoryBoardAttribute.Type
		storyboardName = viewControllerIsConformToFromStoryBoard?.fromStoryboardName ?? storyboardName
		// Init View
		var newViewController = getViewControllerIfExist(storyboardName: storyboardName, identifier: viewName)
		if newViewController == nil {
			if let viewControllerIsConformToView = NSClassFromString("\(module).\(viewName)") as? IMvvmView.Type {
				newViewController = viewControllerIsConformToView.init() as? UIViewController
			}
		}
		return (newViewController)!
	}

	private func getViewControllerIfExist(storyboardName: String, identifier: String?) -> UIViewController? {
		var resultVC: UIViewController?
		do {
			try ObjC.catchException {
				let storyBoard = UIStoryboard(name: storyboardName, bundle: nil)
				if let identifier = identifier {
					resultVC = storyBoard.instantiateViewController(withIdentifier: identifier)
				} else {
					resultVC = storyBoard.instantiateInitialViewController()
				}
			}
		} catch {
			print("ViewController not found [\(storyboardName) - \(identifier ?? "Initial")]")
		}
		return (resultVC)
	}
}

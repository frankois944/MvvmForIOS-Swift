//
//  INavigationService.swift
//  MvvmForIOS
//
//  Created by François Dabonot on 01/02/2018.
//  Copyright © 2018 francois dabonot. All rights reserved.
//

import UIKit
import LGSideMenuController

public protocol INavigationService {
    var navigation:LGSideMenuController { get }
    
    func setCenterViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void
    func setRightSideViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void
    func setLeftSideViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void
    
    func showViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void
    func showViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?) -> Void
    func showViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?, withParameters:AnyObject?) -> Void
    
    func showModalViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!) -> Void
    func showModalViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?) -> Void
    func showModalViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?, customizeModal:((UIViewController) -> (Void))?) -> Void
    func showModalViewModel<T:IBaseViewModel>(viewModelToShow:T.Type!, onCompletion:(() -> (Void))?, customizeModal:((UIViewController) -> (Void))?, withParameters:AnyObject?) -> Void
    
    func closeViewModel<T:IBaseViewModel>(viewModelToClose:T!, onCompletion:(() -> (Void))?) -> Void
    func closeViewModel<T:IBaseViewModel>(viewModelToClose:T!) -> Void
    
    func showLeftPannel(animated:Bool) -> Void
    func showRightPannel(animated:Bool) -> Void
    func hideLeftPannel(animated:Bool) -> Void
    func hideRightPannel(animated:Bool) -> Void
    
    func resolveViewModel<T:IBaseViewModel>(viewModelToGet:T.Type!) -> T!
}

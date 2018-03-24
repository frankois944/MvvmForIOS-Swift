# MvvmForIOS-Swift
MvvmForIOS is a framework for using Mvvm pattern on iOS.

It's fully written in Swift 4 and have some tools for respecting the mvvm pattern.

Content of the framework :
* A structure View/ViewModel/Model
* A navigation service where we manage the navigation between viewModel
* A service locator for IoC capabilities

### Compatibility

* Swift 4
* iOS 8

### Binding issue ?

MvvmForIOS-Swift doesn't have a binding tool.

Currently, I advise to use Bond (https://github.com/DeclarativeHub/Bond)

This framework is specialized for binding content between view and viewModel

Also, you can KVO but it's not fully compatible with Swift.

## How to install MvvmForIOS-Swift

* Carthage

github "frankois944/MvvmForIOS-Swift"

## How to use it
There is a sample who explain how to implement the Framework in Swift project without binding stuff

## Service Locator
There is a service locator which can be used for IoC.

```Swift
//interface
protocol IDataServices : class {
    var name:String! { get }
    func openApplicationSetting() -> Bool
}

class DataServices: IDataServices {
    // ...implement protocol
}

//save
ServiceLocator.register(service: DataServices() as IDataServices)
//get
let service:IDataServices! = ServiceLocator.resolve()
let result = service.openApplicationSetting()
```

### Navigation

#### Important
The navigation is managed trought __INavigationService__.

It also based on __LGSideMenuController__ Framework (https://github.com/Friend-LGA/LGSideMenuController)

All navigation between *Views* are made in the ViewModels, it requires some specifics naming between the *View* + (Storyboard) and the corresponding *ViewModel*.


**For the ViewModel *testViewModel*, the View _must_ be named *testView* and the storyboard must be named *test*.**

The navigation won't work if you do not respect this rule.

#### So how to navigate?

In the ViewModel just call :

```Swift
//Show
self.navigation.showViewModel(viewModelToShow: AnotherViewModel.self)
or 
self.navigation.showViewModel(viewModelToShow: AnotherViewModel.self, onCompletion:nil, withParameters:[SOMEDATA])

//Inside AnotherViewModel 
override func startViewModel(parameters: Any? [SOMEDATA]) {
        
}
//Close
self.navigation.closeViewModel(viewModelToClose: self, onCompletion: { () -> (Void) in
    NSLog("AnotherViewModel closed")
})
```

### INavigationService Interface

INavigationService have a lot of methods for navigating, with completion, parameters ...
```Swift
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
    
    func showLeftPanel(animated:Bool) -> Void
    func showRightPanel(animated:Bool) -> Void
    func hideLeftPanel(animated:Bool) -> Void
    func hideRightPanel(animated:Bool) -> Void
    
    func resolveViewModel<T:IBaseViewModel>(viewModelToGet:T.Type!) -> T!
}
```

### Side Panel

* As this framework is based on __LGSideMenuController__, the use of Panel is easy

```Swift
//in the appDelegate, set root view for Panel
navigation.setCenterViewModel(viewModelToShow: FirstViewModel.self)
navigation.setLeftSideViewModel(viewModelToShow: SecondViewModel.self)
navigation.setRightSideViewModel(viewModelToShow: SecondViewModel.self)

//in a viewModel
//show
navigation.showLeftPanel(animated: true)
navigation.showRightPanel(animated: true)
//hide
navigation.hideLeftPanel(animated: true)
navigation.hideRightPanel(animated: true)
```

* You can also push a viewModel inside a side Panel 

```Swift
the view declaration must have 
class SecondView: BaseView<SecondViewModel>, ILeftPanelAttribute /*mandatory*/ {
//implementation
}
navigation.showViewModel(viewModelToShow: SecondViewModel.self)
```

* You can access to __LGSideMenuController__ with 
```Swift
let lgSideCtr = navigation.navigation;
```
so you can customize this component.


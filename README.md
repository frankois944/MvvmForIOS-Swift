[![Codacy Badge](https://api.codacy.com/project/badge/Grade/985700b7fa1f4c00a23bf441f0e618fd)](https://www.codacy.com/app/frankois/MvvmForIOS-Swift?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=frankois944/MvvmForIOS-Swift&amp;utm_campaign=Badge_Grade)
[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badges/)
[![Build Status](https://travis-ci.com/frankois944/MvvmForIOS-Swift.svg?branch=master)](https://travis-ci.com/frankois944/MvvmForIOS-Swift)
[![Language](https://img.shields.io/badge/language-Swift%204.2-orange.svg)](https://swift.org)

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
```
github "Friend-LGA/LGSideMenuController"
github "frankois944/MvvmForIOS-Swift"
```

* import

```Swift
import MvvmForIOSSwift
```

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
MvvmServiceLocator.register(service: DataServices() as IDataServices)
//get
let service:IDataServices! = MvvmServiceLocator.resolve()
let result = service.openApplicationSetting()
```

### Navigation

#### Important
The navigation is managed trought __INavigationService__ .

It also based on __LGSideMenuController__ Framework (https://github.com/Friend-LGA/LGSideMenuController), If not needed, you can just ignore it because you don't use it directly

* __default__ :

All navigation between *Views* are made in the ViewModels, it requires some specifics naming between the *View* + (Storyboard) and the corresponding *ViewModel*.

**For the ViewModel *testViewModel*, the View _must_ be named *testView* and the storyboard must be named *test*.**

The navigation won't work if you do not respect this rule.

* __Specify the stroyboard name__ :

You can specify the storyboard name with __IMvvmFromStoryBoardAttribute__ (see FirstView)

* __Without storyboard__ :

You can also navigate without storyboard but must follow this rule :

**For the ViewModel *testViewModel*, the View _must_ be named *testView*.**

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
public protocol IMvvmNavigationService {
    var baseNavigation: LGSideMenuController { get }

    func setCenterViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func setRightSideViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func setLeftSideViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)

    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                              onCompletion:(() -> Void)?)
    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                              onCompletion:(() -> Void)?,
                                              withParameters: AnyObject?)

    func showModalViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func showModalViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                                   onCompletion:(() -> Void)?)
    func showModalViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                                   onCompletion:(() -> Void)?,
                                                   customizeModal: ((UIViewController) -> Void)?)
    func showModalViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
                                                   onCompletion:(() -> Void)?,
                                                   customizeModal: ((UIViewController) -> Void)?,
                                                   withParameters: AnyObject?)

    func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T, onCompletion:(() -> Void)?)
    func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T)

    func showLeftPanel(animated: Bool)
    func showRightPanel(animated: Bool)
    func hideLeftPanel(animated: Bool)
    func hideRightPanel(animated: Bool)

    func resolveViewModel<T: IMvvmBaseViewModel>(viewModelToGet: T.Type) -> T
}
```

### Side Panel

* As this framework is based on __LGSideMenuController__, the use of Panel is easy

```Swift
//in the appDelegate, set root view for Panel
navigation.setCenterViewModel(viewModelToShow: FirstViewModel.self) // The initial view of your application
navigation.setLeftSideViewModel(viewModelToShow: SecondViewModel.self) // Ignore it if not needed
navigation.setRightSideViewModel(viewModelToShow: SecondViewModel.self) // Ignore it if not needed

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
class SecondView: MvvmBaseView<SecondViewModel>, ILeftPanelAttribute /*mandatory*/ {
//implementation
}
navigation.showViewModel(viewModelToShow: SecondViewModel.self)
```

* You can access to __LGSideMenuController__ with 
```Swift
let lgSideCtr = navigation.baseNavigation;
```
so you can customize this component.


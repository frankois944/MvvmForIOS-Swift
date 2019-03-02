# MvvmForIOS-Swift
MvvmForIOS is a framework for using Mvvm pattern on iOS.

It's fully written in Swift 4.x and have some tools for respecting the mvvm pattern.

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

Also, you can use KVO but it's not fully compatible with Swift.

## How to install MvvmForIOS-Swift

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

The navigations is based on components trought __INavigationService__ .

    * Presenter

When calling for navigation to another view, the presenter is called, it's a class which implement the protocol IMvvmPresenter.
```swift
/**
* A presenter is use when the app asked for navigate to another view
*/
public protocol IMvvmPresenter {
/**
* Init of the presenter
*/
init(window: UIWindow)
/**
* The current navigation controller
*/
var navigationController: UIViewController { get }

/**
* Called when asking to navigate to another view
*/
func show<T: IMvvmBaseViewModel>(request: MvvmRequest<T>)
/**
* Called when asking closing a view
*/
func close<T: IMvvmBaseViewModel>(viewModel: T)
}
```
    * Container

The container is used before calling the presenter, it retrieve the wanted view by the viewmodel type

```swift
/**
* Used for getting the view
*/
public protocol IMvvmContainer {
init()
/**
* From the viewModel, retrieve the wanted view
*/
func getView<T: IMvvmBaseViewModel>(viewModel: T.Type) -> UIViewController
}

```

The Framework embedded a basic presenter and container but you can replace them when you setup the framework.
```swift
public init(window: UIWindow, presenter: IMvvmPresenter.Type = MvvmBasicPresenter.self, container: IMvvmContainer.Type = MvvmBasicContainer.self)
```

* __The default container__ :

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
    var baseNavigation: UIViewController { get }

    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type)
    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
    onCompletion:(() -> Void)?)
    func showViewModel<T: IMvvmBaseViewModel>(viewModelToShow: T.Type,
    onCompletion:(() -> Void)?,
    withParameters: Any?)

    func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T, onCompletion:(() -> Void)?)
    func closeViewModel<T: IMvvmBaseViewModel>(viewModelToClose: T)

    func resolveViewModel<T: IMvvmBaseViewModel>(viewModelToGet: T.Type) -> T
    func associateViewControllersWithViewModels<T: IMvvmBaseViewModel>(viewModels: [T.Type]) -> [UIViewController]?
}
```

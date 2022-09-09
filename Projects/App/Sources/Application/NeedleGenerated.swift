

import CommonFeature
import IntroFeature
import MainFeature
import NeedleFoundation
import RootFeature
import SwiftUI

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class MainDependency48395af54bd2fa1ccd92Provider: MainDependency {


    init() {

    }
}
/// ^->AppComponent->RootComponent->MainComponent
private func factory8c7fc8c34a96d31e2d1fe3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainDependency48395af54bd2fa1ccd92Provider()
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {


    init() {

    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider()
}
private class IntroDependency72cb5c3a765f7003bf09Provider: IntroDependency {


    init() {

    }
}
/// ^->AppComponent->RootComponent->IntroComponent
private func factoryf95bd3e99343a145d817e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return IntroDependency72cb5c3a765f7003bf09Provider()
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["rootComponent-RootComponent"] = { self.rootComponent as Any }
    }
}
extension MainComponent: Registration {
    public func registerItems() {

    }
}
extension RootComponent: Registration {
    public func registerItems() {

        localTable["rootViewModel-SceneStateModel"] = { self.rootViewModel as Any }
        localTable["introBuilder-IntroComponent"] = { self.introBuilder as Any }
        localTable["mainBuilder-MainComponent"] = { self.mainBuilder as Any }
    }
}
extension IntroComponent: Registration {
    public func registerItems() {

    }
}


#endif

private func factoryEmptyDependencyProvider(_ component: NeedleFoundation.Scope) -> AnyObject {
    return EmptyDependencyProvider(component: component)
}

// MARK: - Registration
private func registerProviderFactory(_ componentPath: String, _ factory: @escaping (NeedleFoundation.Scope) -> AnyObject) {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: componentPath, factory)
}

#if !NEEDLE_DYNAMIC

private func register1() {
    registerProviderFactory("^->AppComponent", factoryEmptyDependencyProvider)
    registerProviderFactory("^->AppComponent->RootComponent->MainComponent", factory8c7fc8c34a96d31e2d1fe3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RootComponent->IntroComponent", factoryf95bd3e99343a145d817e3b0c44298fc1c149afb)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}

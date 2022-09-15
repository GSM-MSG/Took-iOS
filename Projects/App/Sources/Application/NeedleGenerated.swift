

import CommonFeature
import DataModule
import DomainModule
import IntroFeature
import KeychainModule
import MainFeature
import NeedleFoundation
import NetworkModule
import RootFeature
import SigninFeature
import SignupFeature
import SwiftUI
import VerifyFeature

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Traversal Helpers

private func parent1(_ component: NeedleFoundation.Scope) -> NeedleFoundation.Scope {
    return component.parent
}

// MARK: - Providers

#if !NEEDLE_DYNAMIC

private class SignupDependency1ff7d1355204bb65e850Provider: SignupDependency {


    init() {

    }
}
/// ^->AppComponent->SignupComponent
private func factory86602ff0d0dbaf2cb017e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SignupDependency1ff7d1355204bb65e850Provider()
}
private class MainDependency7c6a5b4738b211b8e155Provider: MainDependency {


    init() {

    }
}
/// ^->AppComponent->MainComponent
private func factoryc9274e46e78e70f29c54e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return MainDependency7c6a5b4738b211b8e155Provider()
}
private class RootDependency3944cc797a4a88956fb5Provider: RootDependency {
    var introComponent: IntroComponent {
        return appComponent.introComponent
    }
    var mainComponent: MainComponent {
        return appComponent.mainComponent
    }
    var sceneStateModel: SceneStateModel {
        return appComponent.sceneStateModel
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->RootComponent
private func factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return RootDependency3944cc797a4a88956fb5Provider(appComponent: parent1(component) as! AppComponent)
}
private class SigninDependencyde06a9d0b22764487733Provider: SigninDependency {


    init() {

    }
}
/// ^->AppComponent->SigninComponent
private func factory2882a056d84a613debcce3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return SigninDependencyde06a9d0b22764487733Provider()
}
private class VerifyDependency0d6de67080ea263fd25dProvider: VerifyDependency {


    init() {

    }
}
/// ^->AppComponent->VerifyComponent
private func factoryc9c1a13446a3ac12f8f9e3b0c44298fc1c149afb(_ component: NeedleFoundation.Scope) -> AnyObject {
    return VerifyDependency0d6de67080ea263fd25dProvider()
}
private class IntroDependencye04a89d39c733d937499Provider: IntroDependency {
    var signupComponent: SignupComponent {
        return appComponent.signupComponent
    }
    private let appComponent: AppComponent
    init(appComponent: AppComponent) {
        self.appComponent = appComponent
    }
}
/// ^->AppComponent->IntroComponent
private func factoryaf0e1f54bae4c77ad4acf47b58f8f304c97af4d5(_ component: NeedleFoundation.Scope) -> AnyObject {
    return IntroDependencye04a89d39c733d937499Provider(appComponent: parent1(component) as! AppComponent)
}

#else
extension AppComponent: Registration {
    public func registerItems() {

        localTable["authRepository-AuthRepository"] = { self.authRepository as Any }
        localTable["rootComponent-RootComponent"] = { self.rootComponent as Any }
        localTable["keychain-Keychain"] = { self.keychain as Any }
        localTable["sceneStateModel-SceneStateModel"] = { self.sceneStateModel as Any }
        localTable["introComponent-IntroComponent"] = { self.introComponent as Any }
        localTable["signupComponent-SignupComponent"] = { self.signupComponent as Any }
        localTable["signinComponent-SigninComponent"] = { self.signinComponent as Any }
        localTable["verifyComponent-VerifyComponent"] = { self.verifyComponent as Any }
        localTable["mainComponent-MainComponent"] = { self.mainComponent as Any }
        localTable["signinUseCase-SigninUseCase"] = { self.signinUseCase as Any }
        localTable["signupUseCase-SignupUseCase"] = { self.signupUseCase as Any }
        localTable["logoutUseCase-LogoutUseCase"] = { self.logoutUseCase as Any }
        localTable["authRemoteDataSource-AuthRemoteDataSource"] = { self.authRemoteDataSource as Any }
    }
}
extension SignupComponent: Registration {
    public func registerItems() {

    }
}
extension MainComponent: Registration {
    public func registerItems() {

    }
}
extension RootComponent: Registration {
    public func registerItems() {
        keyPathToName[\RootDependency.introComponent] = "introComponent-IntroComponent"
        keyPathToName[\RootDependency.mainComponent] = "mainComponent-MainComponent"
        keyPathToName[\RootDependency.sceneStateModel] = "sceneStateModel-SceneStateModel"
    }
}
extension SigninComponent: Registration {
    public func registerItems() {

    }
}
extension VerifyComponent: Registration {
    public func registerItems() {

    }
}
extension IntroComponent: Registration {
    public func registerItems() {
        keyPathToName[\IntroDependency.signupComponent] = "signupComponent-SignupComponent"
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
    registerProviderFactory("^->AppComponent->SignupComponent", factory86602ff0d0dbaf2cb017e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->MainComponent", factoryc9274e46e78e70f29c54e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->RootComponent", factory264bfc4d4cb6b0629b40f47b58f8f304c97af4d5)
    registerProviderFactory("^->AppComponent->SigninComponent", factory2882a056d84a613debcce3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->VerifyComponent", factoryc9c1a13446a3ac12f8f9e3b0c44298fc1c149afb)
    registerProviderFactory("^->AppComponent->IntroComponent", factoryaf0e1f54bae4c77ad4acf47b58f8f304c97af4d5)
}
#endif

public func registerProviderFactories() {
#if !NEEDLE_DYNAMIC
    register1()
#endif
}

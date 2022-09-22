import NeedleFoundation
import SwiftUI
import RootFeature
import MainFeature
import IntroFeature
import SignupFeature
import KeychainModule
import CommonFeature
import SigninFeature
import VerifyFeature

final class AppComponent: BootstrapComponent {}

// MARK: - Components
extension AppComponent {
    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

    public var rootComponent: RootComponent {
        shared {
            RootComponent(parent: self)
        }
    }

    public var keychain: Keychain {
        shared {
            DefaultKeychain()
        }
    }
}

// MARK: - Intro
extension AppComponent {
    public var introComponent: IntroComponent {
        IntroComponent(parent: self)
    }

    public var signupComponent: SignupComponent {
        SignupComponent(parent: self)
    }

    public var signinComponent: SigninComponent {
        SigninComponent(parent: self)
    }

    public var verifyComponent: VerifyComponent {
        VerifyComponent(parent: self)
    }
}

// MARK: - Main
extension AppComponent {
    public var mainComponent: MainComponent {
        MainComponent(parent: self)
    }
}

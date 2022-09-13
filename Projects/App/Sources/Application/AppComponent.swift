import NeedleFoundation
import SwiftUI
import RootFeature
import MainFeature
import IntroFeature

final class AppComponent: BootstrapComponent {}

// MARK: - Components
extension AppComponent {
    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

    public var rootComponent: RootComponent {
        RootComponent(parent: self)
    }

    public var mainComponent: MainComponent {
        MainComponent(parent: self)
    }

    public var introComponent: IntroComponent {
        IntroComponent(parent: self)
    }
}

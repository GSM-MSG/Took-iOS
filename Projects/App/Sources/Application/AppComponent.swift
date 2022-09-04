import NeedleFoundation
import SwiftUI
import RootFeature

final class AppComponent: BootstrapComponent {}

// MARK: - Components
extension AppComponent {
    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

    public var rootComponent: RootComponent {
        RootComponent(parent: self)
    }
}

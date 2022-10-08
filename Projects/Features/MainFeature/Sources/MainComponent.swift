import NeedleFoundation
import SwiftUI
import BaseFeature

public protocol MainDependency: Dependency {
}

public final class MainComponent: Component<MainDependency>, ComponentBuilder {
    public func makeView() -> some View {
        MainView()
    }
}

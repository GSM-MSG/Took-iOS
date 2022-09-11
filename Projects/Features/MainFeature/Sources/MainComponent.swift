import NeedleFoundation
import SwiftUI
import CommonFeature

public protocol MainDependency: Dependency {
}

public final class MainComponent: Component<MainDependency>, ComponentBuilder {
    public func makeView() -> some View {
        MainView()
    }
}

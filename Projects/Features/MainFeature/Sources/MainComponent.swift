import NeedleFoundation
import SwiftUI

public protocol MainDependency: Dependency {
}

public protocol MainBuilder {
    associatedtype ViewType: View
    func makeView() -> ViewType
}

public final class MainComponent: Component<MainDependency>, MainBuilder {
    public func makeView() -> some View {
        MainView()
    }
}

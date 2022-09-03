import NeedleFoundation

public protocol RootDependency: Dependency {
}

public final class RootComponent: Component<RootDependency> {
    public var rootViewModel: RootViewModel {
        shared {
            RootViewModel()
        }
    }

    public func makeView() -> RootView {
        RootView(viewModel: rootViewModel)
    }
}

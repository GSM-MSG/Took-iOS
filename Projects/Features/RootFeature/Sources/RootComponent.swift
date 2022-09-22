import NeedleFoundation
import CommonFeature
import IntroFeature
import MainFeature

public protocol RootDependency: Dependency {
    var introComponent: IntroComponent { get }
    var mainComponent: MainComponent { get }
}

public final class RootComponent: Component<RootDependency>, ComponentBuilder {
    public func makeView() -> RootView {
        RootView(
            introBuilder: dependency.introComponent,
            mainBuilder: dependency.mainComponent
        )
    }
}

import NeedleFoundation
import CommonFeature
import IntroFeature
import MainFeature

public protocol RootDependency: Dependency {
    var introComponent: IntroComponent { get }
    var mainComponent: MainComponent { get }
}

public final class RootComponent: Component<RootDependency> {
    public var rootViewModel: SceneStateModel {
        shared {
            SceneStateModel()
        }
    }

    public func makeView() -> RootView {
        RootView(
            sceneStateModel: rootViewModel,
            introBuilder: dependency.introComponent,
            mainBuilder: dependency.mainComponent
        )
    }
}

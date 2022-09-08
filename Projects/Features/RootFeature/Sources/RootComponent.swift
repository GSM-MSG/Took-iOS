import NeedleFoundation
import CommonFeature
import IntroFeature
import MainFeature

public protocol RootDependency: Dependency {
}

public final class RootComponent: Component<RootDependency> {
    public var rootViewModel: SceneStateModel {
        shared {
            SceneStateModel()
        }
    }

    public var introBuilder: IntroComponent {
        IntroComponent(parent: self)
    }

    public var mainBuilder: MainComponent {
        MainComponent(parent: self)
    }

    public func makeView() -> RootView {
        RootView(
            sceneStateModel: rootViewModel,
            introBuilder: introBuilder,
            mainBuilder: mainBuilder
        )
    }
}

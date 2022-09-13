import NeedleFoundation
import CommonFeature
import IntroFeature
import MainFeature

public protocol RootDependency: Dependency {
    var introComponent: IntroComponent { get }
    var mainComponent: MainComponent { get }
    var sceneStateModel: SceneStateModel { get }
}

public final class RootComponent: Component<RootDependency>, ComponentBuilder {
    public func makeView() -> RootView {
        RootView(
            sceneStateModel: dependency.sceneStateModel,
            introBuilder: dependency.introComponent,
            mainBuilder: dependency.mainComponent
        )
    }
}

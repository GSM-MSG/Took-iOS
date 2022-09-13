import NeedleFoundation
import SwiftUI
import CommonFeature

public protocol IntroDependency: Dependency {
}

public final class IntroComponent: Component<IntroDependency>, ComponentBuilder {
    public func makeView() -> some View {
        IntroView()
    }
}

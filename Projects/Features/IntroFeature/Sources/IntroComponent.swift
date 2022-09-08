import NeedleFoundation
import SwiftUI

public protocol IntroDependency: Dependency {
}

public protocol IntroBuilder {
    associatedtype ViewType: View
    func makeView() -> ViewType
}

public final class IntroComponent: Component<IntroDependency>, IntroBuilder {
    public func makeView() -> some View {
        IntroView()
    }
}

import NeedleFoundation
import SwiftUI
import BaseFeature
import SignupFeature

public protocol IntroDependency: Dependency {
    var signupComponent: SignupComponent { get }
}

public final class IntroComponent: Component<IntroDependency>, ComponentBuilder {
    public func makeView() -> some View {
        IntroView(signupComponent: dependency.signupComponent)
    }
}

import NeedleFoundation
import SwiftUI
import CommonFeature
import SignupFeature

public protocol IntroDependency: Dependency {
}

public final class IntroComponent: Component<IntroDependency>, ComponentBuilder {
    public var signupComponent: SignupComponent {
        SignupComponent(parent: self)
    }

    public func makeView() -> some View {
        IntroView(signupComponent: signupComponent)
    }
}

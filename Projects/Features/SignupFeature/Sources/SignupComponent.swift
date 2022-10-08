import NeedleFoundation
import SwiftUI
import BaseFeature
import VerifyFeature

public protocol SignupDependency: Dependency {
    var verifyComponent: VerifyComponent { get }
}

public final class SignupComponent: Component<SignupDependency>, ComponentBuilder {
    public func makeView() -> some View {
        SignupView(
            viewModel: SignupViewModel(),
            verifyComponent: dependency.verifyComponent
        )
    }
}

import NeedleFoundation
import SwiftUI
import CommonFeature

public protocol SignupDependency: Dependency {
}

public final class SignupComponent: Component<SignupDependency>, ComponentBuilder {
    public func makeView() -> some View {
        SignupView(
            viewModel: SignupViewModel()
        )
    }
}

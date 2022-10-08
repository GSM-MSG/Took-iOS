import NeedleFoundation
import SwiftUI
import BaseFeature

public protocol SigninDependency: Dependency {
}

public final class SigninComponent: Component<SigninDependency>, ComponentBuilder {
    public func makeView() -> some View {
        SigninView(
            viewModel: SigninViewModel()
        )
    }
}

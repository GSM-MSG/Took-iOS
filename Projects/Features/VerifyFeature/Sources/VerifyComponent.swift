import NeedleFoundation
import CommonFeature
import SwiftUI

public protocol VerifyDependency: Dependency {
}

public final class VerifyComponent: Component<VerifyDependency> {
    public func makeView(action: @escaping () -> Void) -> some View {
        VerifyView(
            viewModel: VerifyViewModel(),
            action: action
        )
    }
}

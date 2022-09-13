import NeedleFoundation
import SwiftUI

public protocol SignupDependency: Dependency {
}

public final class SignupComponent: Component<SignupDependency> {
    public func makeView() -> some View {
        SignupView()
    }
}

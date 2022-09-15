import NeedleFoundation
import CommonFeature
import DomainModule
import SwiftUI

public protocol VerifyDependency: Dependency {
    var sendEmailUseCase: any SendEmailUseCase { get }
    var emailVerifyUseCase: any EmailVerifyUseCase { get }
}

public final class VerifyComponent: Component<VerifyDependency> {
    public func makeView(email: String, action: @escaping () -> Void) -> some View {
        VerifyView(
            viewModel: VerifyViewModel(
                email: email,
                sendEmailUseCase: dependency.sendEmailUseCase,
                emailVerifyUseCase: dependency.emailVerifyUseCase
            ),
            action: action
        )
    }
}

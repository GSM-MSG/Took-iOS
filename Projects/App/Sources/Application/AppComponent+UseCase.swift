import DataModule
import DomainModule
import NeedleFoundation

// MARK: - UseCase
extension AppComponent {
    // MARK: - Auth
    public var signinUseCase: SigninUseCase {
        shared {
            SigninUseCaseImpl(authRepository: authRepository)
        }
    }

    public var signupUseCase: SignupUseCase {
        shared {
            SignupUseCaseImpl(authRepository: authRepository)
        }
    }

    public var logoutUseCase: LogoutUseCase {
        shared {
            LogoutUseCaseImpl(authRepository: authRepository)
        }
    }
}

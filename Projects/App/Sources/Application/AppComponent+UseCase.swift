import DataModule
import DomainModule
import NeedleFoundation

// MARK: - UseCase
extension AppComponent {
    // MARK: - Auth
    public var signinUseCase: any SigninUseCase {
        shared {
            SigninUseCaseImpl(authRepository: authRepository)
        }
    }

    public var signupUseCase: any SignupUseCase {
        shared {
            SignupUseCaseImpl(authRepository: authRepository)
        }
    }

    public var logoutUseCase: any LogoutUseCase {
        shared {
            LogoutUseCaseImpl(authRepository: authRepository)
        }
    }

    // MARK: - Email
    public var sendEmailUseCase: any SendEmailUseCase {
        shared {
            SendEmailUseCaseImpl(emailRepository: emailRepository)
        }
    }

    public var emailVerifyUseCase: any EmailVerifyUseCase {
        shared {
            EmailVerifylUseCaseImpl(emailRepository: emailRepository)
        }
    }
}

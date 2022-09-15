import DomainModule
import DataModule
import NeedleFoundation

// MARK: - Repository
extension AppComponent {
    // MARK: - Auth
    public var authRepository: any AuthRepository {
        shared {
            AuthRepositoryImpl(authRemoteDataSource: authRemoteDataSource)
        }
    }

    // MARK: - Email
    public var emailRepository: any EmailRepository {
        shared {
            EmailRepositoryImpl(emailRemoteDataSource: emailRemoteDataSource)
        }
    }
}

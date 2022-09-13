import DomainModule
import DataModule
import NeedleFoundation

// MARK: - Repository
extension AppComponent {
    // MARK: - Auth
    public var authRepository: AuthRepository {
        shared {
            AuthRepositoryImpl(authRemoteDataSource: authRemoteDataSource)
        }
    }
}

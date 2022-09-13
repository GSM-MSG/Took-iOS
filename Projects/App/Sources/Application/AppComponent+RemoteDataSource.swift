import DataModule
import NetworkModule
import NeedleFoundation

// MARK: - DataSource
extension AppComponent {
    // MARK: - Auth
    public var authRemoteDataSource: AuthRemoteDataSource {
        shared {
            AuthRemoteDataSourceImpl(keychain: keychain)
        }
    }
}

import DataModule
import NetworkModule
import NeedleFoundation

// MARK: - DataSource
extension AppComponent {
    // MARK: - Auth
    public var authRemoteDataSource: any AuthRemoteDataSource {
        shared {
            AuthRemoteDataSourceImpl(keychain: keychain)
        }
    }

    // MARK: - Email
    public var emailRemoteDataSource: any EmailRemoteDataSource {
        shared {
            EmailRemoteDataSourceImpl(keychain: keychain)
        }
    }

    // MARK: - User
    public var userRemoteDataSource: any UserRemoteDataSource {
        shared {
            UserRemoteDataSourceImpl(keychain: keychain)
        }
    }
}

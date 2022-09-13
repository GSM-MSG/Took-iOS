import DomainModule
import NetworkModule
import DataMappingModule

public struct AuthRepositoryImpl: AuthRepository {
    private let authRemoteDataSource: any AuthRemoteDataSource

    public init(authRemoteDataSource: any AuthRemoteDataSource) {
        self.authRemoteDataSource = authRemoteDataSource
    }
    public func signin(req: SigninRequestDTO) async throws {
        try await authRemoteDataSource.signin(req: req)
    }

    public func signup(req: SignupRequestDTO) async throws {
        try await authRemoteDataSource.signup(req: req)
    }

    public func logout() async throws {
        try await authRemoteDataSource.logout()
    }
}

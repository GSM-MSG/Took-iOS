import DomainModule
import NetworkModule
import DataMappingModule

public struct UserRepositoryImpl: UserRepository {
    private let userRemoteDataSource: any UserRemoteDataSource

    public init(userRemoteDataSource: any UserRemoteDataSource) {
        self.userRemoteDataSource = userRemoteDataSource
    }

    public func myBesinessCard() async throws {
        try await userRemoteDataSource.myBesinessCard()
    }

    public func renewalPassword(req: RenewalPasswordRequestDTO) async throws {
        try await userRemoteDataSource.renewalPassword(req: req)
    }

    public func withdarw(req: RenewalPasswordRequestDTO) async throws {
        try await userRemoteDataSource.withdarw(req: req)
    }

}

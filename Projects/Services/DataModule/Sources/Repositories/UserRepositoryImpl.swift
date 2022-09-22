import DomainModule
import NetworkModule
import DataMappingModule

public struct UserRepositoryImpl: UserRepository {
    private let userRemoteDataSource: any UserRemoteDataSource

    public init(userRemoteDataSource: any UserRemoteDataSource) {
        self.userRemoteDataSource = userRemoteDataSource
    }

    public func myBusinessCard() async throws -> [BusinessCard] {
        try await userRemoteDataSource.myBesinessCard()
            .map { $0.toDomain() }
    }

    public func renewalPassword(password: String) async throws {
        try await userRemoteDataSource.renewalPassword(password: password)
    }

    public func withdarw(password: String) async throws {
        try await userRemoteDataSource.withdarw(password: password)
    }

}

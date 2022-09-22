import APIKit
import DataMappingModule

public protocol UserRemoteDataSource {
    func myBesinessCard() async throws -> [BusinessCardResponseDTO]
    func renewalPassword(password: String) async throws
    func withdarw(password: String) async throws
}

public final class UserRemoteDataSourceImpl: BaseRemoteDataSource<UserAPI>, UserRemoteDataSource {
    public func myBesinessCard() async throws -> [BusinessCardResponseDTO] {
        try await request(.myBusinessCard, dto: [BusinessCardResponseDTO].self)
    }

    public func renewalPassword(password: String) async throws {
        try await request(.renewalPassword(password), dto: NoResponse.self)
    }

    public func withdarw(password: String) async throws {
        try await request(.withdraw(password), dto: NoResponse.self)
    }
}

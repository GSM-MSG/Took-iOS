import APIKit
import DataMappingModule

public protocol UserRemoteDataSource {
    func myBesinessCard() async throws
    func renewalPassword(password: String) async throws
    func withdarw(password: String) async throws
}

public final class UserRemoteDataSourceImpl: BaseRemoteDataSource<UserAPI>, UserRemoteDataSource {
    public func renewalPassword(password: String) async throws {
        try await request(.renewalPassword(password), dto: NoResponse.self)
    }

    public func withdarw(password: String) async throws {
        try await request(.withdraw(password), dto: NoResponse.self)
    }

    public func myBesinessCard() async throws {
        try await request(.myBusinessCard, dto: BusinessCard.self)
    }
}

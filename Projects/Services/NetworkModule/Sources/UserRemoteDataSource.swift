import APIKit
import DataMappingModule

public protocol UserRemoteDataSource {
    func myBesinessCard() async throws
    func renewalPassword(req: RenewalPasswordRequestDTO) async throws
    func withdarw(req: RenewalPasswordRequestDTO) async throws
}

public final class UserRemoteDataSourceImpl: BaseRemoteDataSource<UserAPI>, UserRemoteDataSource {
    public func renewalPassword(req: RenewalPasswordRequestDTO) async throws {
        try await request(.renewalPassword(req.password), dto: NoResponse.self)
    }

    public func withdarw(req: RenewalPasswordRequestDTO) async throws {
        try await request(.withdraw(req.password), dto: NoResponse.self)
    }

    public func myBesinessCard() async throws {
        try await request(.myBusinessCard, dto: BusinessCard.self)
    }
}

import APIKit
import DataMappingModule

public protocol AuthRemoteDataSource {
    func signin(req: SigninRequestDTO) async throws
    func signup(req: SignupRequestDTO) async throws
    func logout() async throws
}

public final class AuthRemoteDataSourceImpl: BaseRemoteDataSource<AuthAPI>, AuthRemoteDataSource {
    public func signin(req: SigninRequestDTO) async throws {
        try await request(.signin(req), dto: NoResponse.self)
    }

    public func signup(req: SignupRequestDTO) async throws {
        try await request(.signup(req), dto: NoResponse.self)
    }

    public func logout() async throws {
        try await request(.logout, dto: NoResponse.self)
    }
}

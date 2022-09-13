import APIKit
import DataMappingModule

public final class AuthRemoteDataSource: BaseRemoteDataSource<AuthAPI> {
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

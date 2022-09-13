import DataMappingModule

public protocol AuthRepository {
    func signin(req: SigninRequestDTO) async throws
    func signup(req: SignupRequestDTO) async throws
    func logout() async throws
}

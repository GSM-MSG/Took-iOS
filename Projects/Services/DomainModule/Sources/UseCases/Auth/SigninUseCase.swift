import DataMappingModule

public protocol SigninUseCase {
    func execute(req: SigninRequestDTO) async throws
}

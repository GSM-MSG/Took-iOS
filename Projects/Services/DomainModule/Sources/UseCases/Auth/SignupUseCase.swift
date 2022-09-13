import DataMappingModule

public protocol SignupUseCase {
    func execute(req: SignupRequestDTO) async throws
}

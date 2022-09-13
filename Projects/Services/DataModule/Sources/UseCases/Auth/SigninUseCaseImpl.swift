import DomainModule
import DataMappingModule

public struct SigninUseCaseImpl: SigninUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: SigninRequestDTO) async throws {
        try await authRepository.signin(req: req)
    }
}

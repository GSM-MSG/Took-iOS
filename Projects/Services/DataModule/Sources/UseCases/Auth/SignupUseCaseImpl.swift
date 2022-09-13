import DomainModule
import DataMappingModule

public struct SignupUseCaseImpl: SignupUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute(req: SignupRequestDTO) async throws {
        try await authRepository.signup(req: req)
    }
}

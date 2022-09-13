import DomainModule
import DataMappingModule

public struct LogoutUseCaseImpl: LogoutUseCase {
    private let authRepository: any AuthRepository

    public init(authRepository: any AuthRepository) {
        self.authRepository = authRepository
    }

    public func execute() async throws {
        try await authRepository.logout()
    }
}

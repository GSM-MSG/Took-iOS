import DomainModule
import DataMappingModule

public struct WithdrawUseCaseImpl: WithdrawUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func execute(password: String) async throws {
        try await userRepository.withdarw(password: password)
    }
}

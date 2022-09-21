import DomainModule
import DataMappingModule

public struct RenewalPasswordUseCasImpl: RenewalPasswordUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }
    
    public func execute(password: String) async throws {
        try await userRepository.renewalPassword(req: password)
    }
}

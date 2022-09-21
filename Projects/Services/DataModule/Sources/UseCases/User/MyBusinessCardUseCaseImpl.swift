import DomainModule
import DataMappingModule

public struct MyBusinessCardUseCaseImpl: MyBuinessUseCase {
    private let userRepository: any UserRepository

    public init(userRepository: any UserRepository) {
        self.userRepository = userRepository
    }

    public func execute() async throws {
        try await userRepository.myBusinessCard()
    }
}

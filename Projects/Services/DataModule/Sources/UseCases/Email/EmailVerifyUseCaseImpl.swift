import DomainModule

public struct EmailVerifylUseCaseImpl: EmailVerifyUseCase {
    private let emailRepository: any EmailRepository

    public init(emailRepository: any EmailRepository) {
        self.emailRepository = emailRepository
    }

    public func execute(email: String, code: String) async throws {
        try await emailRepository.verify(email: email, code: code)
    }
}

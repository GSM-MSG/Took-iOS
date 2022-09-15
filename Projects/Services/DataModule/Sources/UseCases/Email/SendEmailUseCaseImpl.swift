import DomainModule

public struct SendEmailUseCaseImpl: SendEmailUseCase {
    private let emailRepository: any EmailRepository

    public init(emailRepository: any EmailRepository) {
        self.emailRepository = emailRepository
    }

    public func execute(email: String) async throws {
        try await emailRepository.sendEmail(email: email)
    }
}

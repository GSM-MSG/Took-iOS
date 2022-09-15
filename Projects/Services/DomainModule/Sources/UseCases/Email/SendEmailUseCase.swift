public protocol SendEmailUseCase {
    func execute(email: String) async throws
}

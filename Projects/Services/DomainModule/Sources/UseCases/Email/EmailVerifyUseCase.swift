public protocol EmailVerifyUseCase {
    func execute(email: String, code: String) async throws
}

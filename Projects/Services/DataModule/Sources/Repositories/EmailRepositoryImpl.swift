import DomainModule
import NetworkModule

public struct EmailRepositoryImpl: EmailRepository {
    private let emailRemoteDataSource: any EmailRemoteDataSource

    public init(emailRemoteDataSource: any EmailRemoteDataSource) {
        self.emailRemoteDataSource = emailRemoteDataSource
    }

    public func sendEmail(email: String) async throws {
        try await emailRemoteDataSource.sendEmail(email: email)
    }

    public func verify(email: String, code: String) async throws {
        try await emailRemoteDataSource.verifyCode(email: email, code: code)
    }
}

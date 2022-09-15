import APIKit
import DataMappingModule

public protocol EmailRemoteDataSource {
    func sendEmail(email: String) async throws
    func verifyCode(email: String, code: String) async throws
}

public final class EmailRemoteDataSourceImpl: BaseRemoteDataSource<EmailAPI>, EmailRemoteDataSource {
    public func sendEmail(email: String) async throws {
        try await request(.send(email), dto: NoResponse.self)
    }

    public func verifyCode(email: String, code: String) async throws {
        try await request(.verify(email: email, code: code), dto: NoResponse.self)
    }
}

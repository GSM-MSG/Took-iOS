import DataMappingModule

public protocol EmailRepository {
    func sendEmail(email: String) async throws
    func verify(email: String, code: String) async throws
}

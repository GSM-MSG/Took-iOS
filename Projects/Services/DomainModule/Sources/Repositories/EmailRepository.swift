import DataMappingModule

public protocol EmailRepository {
    func send(email: String) async throws
    func verify(email: String, code: String) async throws
}

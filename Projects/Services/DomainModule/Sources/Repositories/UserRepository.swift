import DataMappingModule

public protocol UserRepository {
    func myBesinessCard() async throws
    func renewalPassword(password: String) async throws
    func withdarw(password: String) async throws
}

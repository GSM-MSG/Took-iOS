import DataMappingModule

public protocol UserRepository {
    func myBusinessCard() async throws -> [BusinessCard]
    func renewalPassword(password: String) async throws
    func withdarw(password: String) async throws
}

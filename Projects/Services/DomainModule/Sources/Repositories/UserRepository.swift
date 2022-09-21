import DataMappingModule

public protocol UserRepository {
    func myBesinessCard() async throws
    func renewalPassword(req: RenewalPasswordRequestDTO) async throws
    func withdarw(req: RenewalPasswordRequestDTO) async throws
}

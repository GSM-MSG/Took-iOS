import DataMappingModule

public protocol RenewalPasswordUseCase {
    func execute(password: String) async throws
}

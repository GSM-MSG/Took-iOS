import DataMappingModule

public protocol WithdrawUseCase {
    func execute(password: String) async throws
}

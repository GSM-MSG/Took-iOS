import Foundation

public struct RenewalPasswordRequestDTO: Equatable, Encodable {
    public init(password: String) {
        self.password = password
    }

    public let password: String
}

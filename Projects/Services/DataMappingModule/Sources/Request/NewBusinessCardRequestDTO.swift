import Foundation

public struct NewBusinessCardRequestDTO: Equatable, Encodable {
    public init(frontUrl: String, backUrl: String) {
        self.frontUrl = frontUrl
        self.backUrl = backUrl
    }

    public let frontUrl: String
    public let backUrl: String
}

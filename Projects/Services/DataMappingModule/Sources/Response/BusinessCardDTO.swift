import Foundation

public struct BusinessCard: Decodable {
    public init(
        uuid: String,
        frontUrl: String,
        backUrl: String,
        createdAt: String,
        updatedAt: String
    ) {
        self.uuid = uuid
        self.frontUrl = frontUrl
        self.backUrl = backUrl
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public let uuid: String
    public let frontUrl: String
    public let backUrl: String
    public let createdAt: String
    public let updatedAt: String
}

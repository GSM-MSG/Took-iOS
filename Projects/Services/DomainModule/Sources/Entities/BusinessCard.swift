import Foundation
import DataMappingModule

public struct BusinessCard: Equatable {
    public init(
        uuid: String,
        frontUrl: String,
        backUrl: String,
        createdAt: Date,
        updatedAt: Date
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
    public let createdAt: Date
    public let updatedAt: Date
}

public extension BusinessCardResponseDTO {
    func toDomain() -> BusinessCard {
        return .init(
            uuid: uuid,
            frontUrl: frontUrl,
            backUrl: backUrl,
            createdAt: createdAt.toDate(),
            updatedAt: updatedAt.toDate()
        )
    }
}

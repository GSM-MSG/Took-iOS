import Foundation

public enum TookError: Error {
    case unknown
    case custom(message: String, status: Int)

    // MARK: - Auth
    case notVerifiedEmail
    case alreadyExistEmail
}

extension TookError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "알 수 없는 에러가 일어났습니다."
        case let .custom(message, _):
            return message
        }
    }
}

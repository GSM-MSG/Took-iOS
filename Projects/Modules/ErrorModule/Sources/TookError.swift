import Foundation

public enum TookError: Error {
    case unknown
    case custom(message: String, status: Int)

    // MARK: - Auth
    case notVerifiedEmail
    case alreadyExistEmail
}

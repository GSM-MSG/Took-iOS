import Foundation

public enum TookError: Error {
    case unknown
    case custom(message: String, status: Int)

    // MARK: - Auth
    case notVerifiedEmail
    case alreadyExistEmail

    // MARK: - Email
    case manyToRequestEmail
    case authKeyNotMatched

    // MARK: - User
    case passwordNotValid
    case emailNotCertification
    case passwordNotSame
}

extension TookError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .unknown:
            return "알 수 없는 에러가 일어났습니다"
        case let .custom(message, _):
            return message
        case .notVerifiedEmail:
            return "인증되지 않은 이메일입니다"
        case .alreadyExistEmail:
            return "이미 존재하는 이메일입니다"
        case .manyToRequestEmail:
            return "인증코드는 15분에 최대 3번만 보낼 수 있습니다"
        case .authKeyNotMatched:
            return "인증코드가 일치하지 않습니다"
        case .passwordNotValid:
            return "비밀번호가 조건에 맞지 않습니다"
        case .emailNotCertification:
            return "인증 되지않은 이메일입니다"
        case .passwordNotSame:
            return "비밀번호가 일치하지 않습니다"
        }
    }
}

public extension Error {
    var asTookError: TookError {
        self as? TookError ?? .unknown
    }
}

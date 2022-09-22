import Moya
import ErrorModule

public enum UserAPI {
    case myBusinessCard
    case renewalPassword(String)
    case withdraw(String)
}

extension UserAPI: TookAPI {
    public var domain: TookDomain {
        .user
    }

    public var urlPath: String {
        switch self {
        case .myBusinessCard, .renewalPassword, .withdraw:
            return ""
        }
    }

    public var method: Method {
        switch self {
        case .myBusinessCard:
            return .get
        case .renewalPassword:
            return .patch
        case .withdraw:
            return .delete
        }
    }

    public var task: Task {
        switch self {
        case let .renewalPassword(password):
            return .requestParameters(parameters: [
                "password": password
            ], encoding: JSONEncoding.default)
        case let .withdraw(password):
            return .requestParameters(parameters: [
                "password": password
            ], encoding: URLEncoding.queryString)
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMapper: [Int: TookError] {
        switch self {
        case .myBusinessCard:
            return [
                404: .unknown,
                500: .unknown
            ]
        case .renewalPassword:
            return [
                400: .passwordNotValid,
                401: .emailNotCertification,
                500: .unknown
            ]
        case .withdraw:
            return [
                400: .passwordNotSame,
                404: .unknown,
                500: .unknown
            ]
        }
    }
}

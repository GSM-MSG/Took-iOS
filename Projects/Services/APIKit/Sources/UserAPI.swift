import Moya
import ErrorModule

public enum UserAPI {
    case myBusinessCard
    case reset(String)
    case secession(String)
}

extension UserAPI: TookAPI {
    public var domain: TookDomain {
        .user
    }

    public var urlPath: String {
        switch self {
        case .myBusinessCard, .reset, .secession:
            return ""
        }
    }

    public var method: Method {
        switch self {
        case .myBusinessCard:
            return .get
        case .reset:
            return .patch
        case .secession:
            return .delete
        }
    }

    public var task: Task {
        switch self {
        case let .reset(password):
            return .requestParameters(parameters: [
                "password": password
            ], encoding: JSONEncoding.default)
        case let .secession(password):
            return .requestParameters(parameters: [
                "password": password
            ], encoding: JSONEncoding.default)
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
                500: .unknown
            ]
        case .reset:
            return [
                500: .unknown
            ]
        case .secession:
            return [
                404: .unknown,
                500: .unknown
            ]
        }
    }
}

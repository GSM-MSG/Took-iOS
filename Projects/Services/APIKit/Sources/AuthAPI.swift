import Moya
import ErrorModule
import DataMappingModule

public enum AuthAPI {
    case signin(SigninRequestDTO)
    case signup(SignupRequestDTO)
    case refresh
    case logout
}

extension AuthAPI: TookAPI {
    public var domain: TookDomain {
        .auth
    }

    public var urlPath: String {
        switch self {
        case .signup:
            return "/signup"
        case .signin, .refresh, .logout:
            return ""
        }
    }

    public var method: Method {
        switch self {
        case .signup, .signin:
            return .post
        case .refresh:
            return .patch
        case .logout:
            return .delete
        }
    }

    public var task: Task {
        switch self {
        case let .signin(req):
            return .requestJSONEncodable(req)
        case let .signup(req):
            return .requestJSONEncodable(req)
        default:
            return .requestPlain
        }
    }

    public var jwtTokenType: JwtTokenType {
        switch self {
        case .signup, .signin:
            return .none
        case .refresh:
            return .refreshToken
        case .logout:
            return .accessToken
        }
    }

    public var errorMapper: [Int: TookError] {
        switch self {
        case .signin:
            return [
                401: .notVerifiedEmail,
                500: .unknown
            ]
        case .signup:
            return [
                409: .alreadyExistEmail,
                500: .unknown
            ]
        case .refresh:
            return [
                500: .unknown
            ]
        case .logout:
            return [
                500: .unknown
            ]
        }
    }
}

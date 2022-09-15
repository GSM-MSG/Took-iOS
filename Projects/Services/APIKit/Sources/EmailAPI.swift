import Moya
import ErrorModule

public enum EmailAPI {
    case send(String)
    case verify(email: String, code: String)
}

extension EmailAPI: TookAPI {
    public var domain: TookDomain {
        .email
    }

    public var urlPath: String {
        switch self {
        case .send, .verify:
            return ""
        }
    }

    public var method: Moya.Method {
        switch self {
        case .verify:
            return .head
        case .send:
            return .post
        }
    }

    public var task: Moya.Task {
        switch self {
        case let .send(email):
            return .requestParameters(parameters: [
                "email": email
            ], encoding: JSONEncoding.default)
        case let .verify(email, code):
            return .requestParameters(parameters: [
                "email": email,
                "authKey": code
            ], encoding: URLEncoding.queryString)
        }
    }

    public var jwtTokenType: JwtTokenType {
        .accessToken
    }

    public var errorMapper: [Int: TookError] {
        switch self {
        case .send:
            return [
                429: .manyToRequestEmail,
                500: .unknown
            ]
        case .verify:
            return [
                400: .authKeyNotMatched,
                500: .unknown
            ]
        }
    }
}

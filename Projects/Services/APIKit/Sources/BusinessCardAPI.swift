import Moya
import ErrorModule
import DataMappingModule

public enum BusinessCardAPI {
    case newBusinessCard(NewBusinessCardRequestDTO)
    case businessCardList
    case exchangeBusinessCard(String)
}

extension BusinessCardAPI: TookAPI {
    public var domain: TookDomain {
        .businessCard
    }

    public var urlPath: String {
        switch self {
        case .newBusinessCard, .businessCardList:
            return ""
        case .exchangeBusinessCard:
            return "/send"
        }
    }

    public var method: Method {
        switch self {
        case .businessCardList:
            return .get
        case .newBusinessCard, .exchangeBusinessCard:
            return .post
        }
    }

    public var task: Task {
        switch self {
        case let .newBusinessCard(req):
            return .requestJSONEncodable(req)
        case let .exchangeBusinessCard(uuid):
            return .requestParameters(parameters: [
                "uuid": uuid
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
        case .newBusinessCard:
            return [
                401: .unknown,
                500: .unknown
            ]
        case .businessCardList:
            return [
                500: .unknown
            ]
        case .exchangeBusinessCard:
            return [
                404: .unknown,
                500: .unknown
            ]
        }
    }
}

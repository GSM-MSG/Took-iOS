import Moya
import Foundation
import KeychainModule

public protocol JwtAuthorizable {
    var jwtTokenType: JwtTokenType { get }
}

public enum JwtTokenType: String {
    case accessToken = "Authorization"
    case refreshToken = "RefreshToken"
    case none
}

struct JwtPlugin: PluginType {
    private let keychain = Keychain()

    func prepare(
        _ request: URLRequest,
        target: TargetType
    ) -> URLRequest {
        guard let jwtTokenType  = (target as? JwtAuthorizable)?.jwtTokenType,
              jwtTokenType != .none
        else { return request }
        var req = request
        let token = jwtTokenType == .accessToken ?
        "Bearer \(getToken(type: .accessToken))" :
        getToken(type: .refreshToken)

        req.addValue(token, forHTTPHeaderField: jwtTokenType.rawValue)
        return req
    }

    func didReceive(
        _ result: Result<Response, MoyaError>,
        target: TargetType
    ) {
        switch result {
        case let .success(res):
            if let new = try? res.map(TokenDTO.self) {
                saveToken(token: new)
            }
        default:
            break
        }
    }
}

private extension JwtPlugin {
    func getToken(type: KeychainType) -> String {
        switch type {
        case .accessToken:
            return keychain.load(type: .accessToken)
        case .refreshToken:
            return keychain.load(type: .refreshToken)
        case .expiredAt:
            return keychain.load(type: .expiredAt)
        }
    }
    func saveToken(token: TokenDTO) {
        keychain.save(type: .accessToken, value: token.accessToken)
        keychain.save(type: .refreshToken, value: token.refreshToken)
        keychain.save(type: .expiredAt, value: token.expiredAt)
    }
}

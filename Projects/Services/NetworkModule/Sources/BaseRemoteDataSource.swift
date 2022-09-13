import APIKit
import Moya
import KeychainModule
import ErrorModule
import Foundation
import Utility

// swiftlint: disable force_cast
class BaseRemoteDataSource<API: TookAPI> {
    private let keychain: Keychain
    private let provider: MoyaProvider<API>
    private let decoder = JSONDecoder()
    private let maxRetryCount = 3

    init(
        keychain: Keychain,
        provider: MoyaProvider<API>? = nil
    ) {
        self.keychain = keychain
        #if DEBUG
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain), NetworkLoggerPlugin()])
        #else
        self.provider = provider ?? MoyaProvider(plugins: [JwtPlugin(keychain: keychain)])
        #endif
    }

    @discardableResult
    func request<T: Decodable>(_ api: API, dto: T.Type) async throws -> T {
        let res = try await checkIsApiNeedsAuth(api) ? authorizedRequest(api) : defaultRequest(api)
        return try decoder.decode(dto, from: res.data)
    }
}

private extension BaseRemoteDataSource {
    func defaultRequest(_ api: API) async throws -> Response {
        for _ in 0..<maxRetryCount {
            do {
                return try await performRequest(api)
            } catch {
                continue
            }
        }
        return try await performRequest(api)
    }

    func authorizedRequest(_ api: API) async throws -> Response {
        for _ in 0..<maxRetryCount {
            do {
                return try await performRequest(api)
            } catch {
                if checkTokenIsExpired() { try await refreshToken() }
                continue
            }
        }
        return try await performRequest(api)
    }

    func performRequest(_ api: API) async throws -> Response {
        try await withCheckedThrowingContinuation { config in
            provider.request(api) { result in
                switch result {
                case let .success(res):
                    config.resume(returning: res)
                case let .failure(err):
                    let code = err.response?.statusCode ?? 500
                    config.resume(
                        throwing: api.errorMapper[code] ?? .custom(message: "알 수 없는 에러가 발생했습니다.", status: 500)
                    )
                }
            }
        }
    }

    func checkIsApiNeedsAuth(_ api: API) -> Bool {
        api.jwtTokenType == .accessToken
    }
    func checkTokenIsExpired() -> Bool {
        let expired = keychain.load(type: .expiredAt).toTookDate()
        return Date() > expired
    }

    func refreshToken() async throws {
        _ = try await performRequest(AuthAPI.refresh as! API)
    }
}

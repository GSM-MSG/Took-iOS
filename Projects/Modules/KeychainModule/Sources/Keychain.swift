import Foundation

public enum KeychainType: String {
    case accessToken = "ACCESS-TOKEN"
    case refreshToken = "REFRESH-TOKEN"
    case expiredAt = "EXPIRED-AT"
}

public struct Keychain {
    private let service: String
    public init(service: String = Bundle.main.bundleIdentifier ?? "") {
        self.service = service
    }

    public func save(type: KeychainType, value: String) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: type.rawValue,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false) ?? .init()
        ]
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    public func load(type: KeychainType) -> String {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: type.rawValue,
            kSecReturnData: kCFBooleanTrue!,
            kSecMatchLimit: kSecMatchLimitOne
        ]
        var ref: AnyObject?
        _ = SecItemCopyMatching(query, &ref)
        guard let data = ref as? Data else { return "" }
        let value = String(data: data, encoding: .utf8)
        return value ?? ""
    }

    public func delete(type: KeychainType) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrService: service,
            kSecAttrAccount: type.rawValue
        ]
        SecItemDelete(query)
    }
}

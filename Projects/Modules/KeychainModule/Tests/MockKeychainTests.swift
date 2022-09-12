import XCTest
@testable import KeychainModule

final class MockKeychainTests: XCTestCase {

    var keychain: Keychain!

    override func setUp() {
        keychain = MockKeyChain()
    }

    override func tearDown() {
        keychain.delete(type: .accessToken)
        keychain.delete(type: .refreshToken)
        keychain.delete(type: .expiredAt)
    }

    func test_save_and_load_access_data() {
        let access = "Access"
        keychain.save(type: .accessToken, value: access)
        XCTAssertFalse(keychain.load(type: .accessToken).isEmpty)
        XCTAssertEqual(keychain.load(type: .accessToken), access)
    }

    func test_save_and_load_refresh_data() {
        let refresh = "Refresh"
        keychain.save(type: .refreshToken, value: refresh)
        XCTAssertFalse(keychain.load(type: .refreshToken).isEmpty)
        XCTAssertEqual(keychain.load(type: .refreshToken), refresh)
    }

    func test_save_and_load_expired_at_data() {
        let expired = "expired"
        keychain.save(type: .expiredAt, value: expired)
        XCTAssertFalse(keychain.load(type: .expiredAt).isEmpty)
        XCTAssertEqual(keychain.load(type: .expiredAt), expired)
    }

    func test_save_and_delete_data() {
        let data = "test"
        keychain.save(type: .accessToken, value: data)
        XCTAssertFalse(keychain.load(type: .accessToken).isEmpty)
        XCTAssertEqual(keychain.load(type: .accessToken), data)

        keychain.delete(type: .accessToken)
        XCTAssertTrue(keychain.load(type: .accessToken).isEmpty)
        XCTAssertNotEqual(keychain.load(type: .accessToken), data)
        XCTAssertEqual(keychain.load(type: .accessToken), "")
    }
}

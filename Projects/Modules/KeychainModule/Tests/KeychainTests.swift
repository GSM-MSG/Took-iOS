import XCTest
@testable import KeychainModule

final class KeychainTests: XCTestCase {

    var sut: Keychain!

    override func setUp() {
        sut = Keychain(service: "keychain.test.service")
    }

    override func tearDown() {
        sut.delete(type: .accessToken)
        sut.delete(type: .refreshToken)
        sut.delete(type: .expiredAt)
    }

    func test_save_access_data() throws {
        XCTAssertEqual("T.T", "T.T")
    }
}

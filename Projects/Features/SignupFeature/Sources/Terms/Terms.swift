import Foundation

enum Terms: CaseIterable {
    case privacy
}

extension Terms {
    var display: String {
        switch self {
        case .privacy:
            return "개인정보처리방침"
        }
    }
    var detailLink: URL {
        switch self {
        case .privacy:
            return URL(string: "https://www.google.com")!
        }
    }
}

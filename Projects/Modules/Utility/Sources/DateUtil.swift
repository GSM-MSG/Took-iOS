import Foundation

public extension String {
    func toTookDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = TimeZone(identifier: "UTC")
        return formatter.date(from: self) ?? .init()
    }
}

public extension Date {
    func toTookDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        formatter.timeZone = .init(identifier: "UTC")
        return formatter.string(from: self)
    }
}

import Foundation

extension String {
    func toDate() -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-DD'T'HH:mm:ss"
        formatter.locale = Locale(identifier: "Ko_Kr")
        return formatter.date(from: self) ?? .init()
    }
}

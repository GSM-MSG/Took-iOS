import SwiftUI

public protocol ComponentBuilder {
    associatedtype ViewType: View
    func makeView() -> ViewType
}

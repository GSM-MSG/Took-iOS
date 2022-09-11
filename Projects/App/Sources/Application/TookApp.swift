import SwiftUI
import NeedleFoundation
import DesignSystem

@main
struct TookApp: App {

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            VStack {
                TookTextField("123", isError: false, buttonAction: {}, onCommit: {}, text: .constant(""))
            }
        }
    }
}

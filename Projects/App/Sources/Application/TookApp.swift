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
            AppComponent().makeRootView()
        }
    }
}

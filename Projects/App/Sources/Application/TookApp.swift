import SwiftUI
import NeedleFoundation
import NewCardFeature

@main
struct TookApp: App {

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            NewCardView()
        }
    }
}

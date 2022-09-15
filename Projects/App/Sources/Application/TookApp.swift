import SwiftUI
import NeedleFoundation
import VerifyFeature

@main
struct TookApp: App {

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().verifyComponent.makeView(email: "", action: {})
        }
    }
}

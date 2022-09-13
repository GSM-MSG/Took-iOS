import SwiftUI
import NeedleFoundation
import SignupFeature

@main
struct TookApp: App {

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            NavigationView {
                SignupView(viewModel: .init())
            }
        }
    }
}

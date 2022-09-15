import SwiftUI
import NeedleFoundation
import NewPasswordFeature

@main
struct TookApp: App {

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            NewPasswordView(viewModel: NewPasswordViewModel())
        }
    }
}

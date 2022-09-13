import SwiftUI
import NeedleFoundation
import SigninFeature

@main
struct TookApp: App {

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            SigninView(viewModel: SigninViewModel())
        }
    }
}

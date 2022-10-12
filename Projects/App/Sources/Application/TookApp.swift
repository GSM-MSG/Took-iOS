import SwiftUI
import NeedleFoundation
import NewCardFeature
import MainFeature

@main
struct TookApp: App {

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            AppComponent().signupComponent.makeView()
//            NewCardView(viewModel: NewCardViewModel())
        }
    }
}

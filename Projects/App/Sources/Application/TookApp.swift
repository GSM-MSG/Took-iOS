import SwiftUI
import NeedleFoundation
import CardListFeature

@main
struct TookApp: App {

    init() {
        registerProviderFactories()
    }

    var body: some Scene {
        WindowGroup {
            CardListView(viewModel: .init())
//            AppComponent().makeRootView()
        }
    }
}

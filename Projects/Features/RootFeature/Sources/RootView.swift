import SwiftUI
import CommonFeature
import IntroFeature
import MainFeature

public struct RootView: View {
    @StateObject var sceneStateModel: SceneStateModel
    let introBuilder: IntroComponent
    let mainBuilder: MainComponent

    public init(
        sceneStateModel: SceneStateModel,
        introBuilder: IntroComponent,
        mainBuilder: MainComponent
    ) {
        _sceneStateModel = StateObject(wrappedValue: sceneStateModel)
        self.introBuilder = introBuilder
        self.mainBuilder = mainBuilder
    }

    public var body: some View {
        switch sceneStateModel.sceneState {
        case .intro:
            introBuilder.makeView()
                .environmentObject(sceneStateModel)
        case .main:
            mainBuilder.makeView()
                .environmentObject(sceneStateModel)
        }
    }
}

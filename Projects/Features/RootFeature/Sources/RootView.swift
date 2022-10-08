import SwiftUI
import BaseFeature
import IntroFeature
import MainFeature

public struct RootView: View {
    @AppStorage(StorageKeys.sceneState.rawValue) var sceneState: SceneState = .intro
    let introBuilder: IntroComponent
    let mainBuilder: MainComponent

    public init(
        introBuilder: IntroComponent,
        mainBuilder: MainComponent
    ) {
        self.introBuilder = introBuilder
        self.mainBuilder = mainBuilder
    }

    public var body: some View {
        switch sceneState {
        case .intro:
            introBuilder.makeView()
        case .main:
            mainBuilder.makeView()
        }
    }
}

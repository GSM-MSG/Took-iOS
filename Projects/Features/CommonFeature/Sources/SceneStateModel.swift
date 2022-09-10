import SwiftUI
import Combine

public final class SceneStateModel: ObservableObject {
    @Published public var sceneState: SceneState

    public init() {
        sceneState = .main
    }
}

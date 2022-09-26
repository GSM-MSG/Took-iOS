import NeedleFoundation
import SwiftUI
import CommonFeature

public protocol NewCardDependency: Dependency {
}

public final class NewCardComponent: Component<NewCardDependency>, ComponentBuilder {
    public func makeView() -> some View {
        NewCardView()
    }
}

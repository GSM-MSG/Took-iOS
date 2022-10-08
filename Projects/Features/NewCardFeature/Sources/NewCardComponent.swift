import NeedleFoundation
import SwiftUI
import BaseFeature

public protocol NewCardDependency: Dependency {
}

public final class NewCardComponent: Component<NewCardDependency>, ComponentBuilder {
    public func makeView() -> some View {
        NewCardView(viewModel: NewCardViewModel())
    }
}

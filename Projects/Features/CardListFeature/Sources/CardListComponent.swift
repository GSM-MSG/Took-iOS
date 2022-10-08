import NeedleFoundation
import SwiftUI
import BaseFeature

public protocol CardListDependency: Dependency {
}

public final class CardListComponent: Component<CardListDependency>, ComponentBuilder {

    public func makeView() -> some View {
        CardListView(viewModel: CardListViewModel())
    }
}

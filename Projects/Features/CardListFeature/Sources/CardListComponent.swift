import NeedleFoundation
import SwiftUI
import CommonFeature

public protocol CardListDependency: Dependency {
}

public final class CardListComponent: Component<CardListDependency>, ComponentBuilder {

    public func makeView() -> some View {
        CardListView()
    }
}

import NeedleFoundation
import SwiftUI

public protocol CardListDependency: Dependency {
}

public protocol CardListBuilder {
    associatedtype ViewType: View
    func makeView() -> ViewType
}

public final class CardListComponent: Component<CardListDependency>, CardListBuilder {

    public func makeView() -> some View {
        CardListView()
    }
}

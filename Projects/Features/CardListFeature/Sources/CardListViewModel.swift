import Combine

public final class CardListViewModel: ObservableObject {
    @Published var cardStyle: CardStyle

    public init() {
        self.cardStyle = .vertical
    }
}

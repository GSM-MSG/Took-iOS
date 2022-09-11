import SwiftUI
import DesignSystem

public struct CardListView: View {
    @StateObject var viewModel: CardListViewModel = .init()

    var isVertical: Bool {
        viewModel.cardStyle == .vertical
    }

    let columns = Array(repeating: GridItem(.flexible()), count: 2)
    public init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [
            .foregroundColor: DesignSystemAsset.Colors.white.color,
            .font: UIFont.systemFont(ofSize: 17, weight: .bold)
        ]

        UINavigationBar.appearance().standardAppearance = appearance
    }
    public var body: some View {
        GeometryReader { proxy in
            NavigationView {
                ZStack {
                    TookImage(.background)
                        .ignoresSafeArea()
                        .zIndex(0)
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: columns, spacing: 16) {
                            ForEach(0..<10) { _ in
                                horizontalCardView()
                                    .frame(width: (proxy.size.width / 2) - 16)
                                    .frame(
                                        height: isVertical ?
                                        ((proxy.size.width / 2) - 16) * 0.5988 :
                                        ((proxy.size.width / 2) - 16) * 1.4161
                                    )
                                    .background(Color.Took.white)
                                    .cornerRadius(4)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .zIndex(1)
                }
                .navigationTitle("명함목록")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            withAnimation {
                                viewModel.cardStyle = .vertical
                            }
                        } label: {
                            TookIcon(
                                .vertical,
                                color: isVertical ? .Took.white : .Took.darkGray
                            )
                        }

                        Button {
                            withAnimation {
                                viewModel.cardStyle = .horizontal
                            }
                        } label: {
                            TookIcon(
                                .horizontal,
                                color: !isVertical ? .Took.white : .Took.darkGray
                            )
                        }
                    }
                }
            }
            .navigationViewStyle(.stack)
        }
    }

    @ViewBuilder
    func horizontalCardView() -> some View {
        VStack {
            Text("A")
                .foregroundColor(.white)
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView()
    }
}

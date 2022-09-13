import SwiftUI
import DesignSystem

public struct CardListView: View {
    @StateObject var viewModel: CardListViewModel
    var isVertical: Bool {
        viewModel.cardStyle == .vertical
    }
    let columns = Array(repeating: GridItem(.flexible()), count: 2)

    public init(viewModel: CardListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
                                VStack {
                                    Text("A")
                                }
                                .frame(width: (proxy.size.width / 2) - 16)
                                .frame(
                                    height: isVertical ?
                                        ((proxy.size.width / 2) - 16) * 0.6 :
                                        ((proxy.size.width / 2) - 16) * 1.65
                                )
                                .background(Color.Took.white)
                                .cornerRadius(4)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 24)
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
}

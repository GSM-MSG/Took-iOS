import SwiftUI
import DesignSystem

public struct MainView: View {
    @State var selection: Int = 0

    public init() {
        UITabBar.appearance().isHidden = true
    }

    public var body: some View {
        ZStack {
            TabView(selection: $selection) {
                TookImage(.background)
                    .ignoresSafeArea()
                    .tag(0)
            }
            VStack {
                Spacer()

                ZStack {
                    Rectangle()
                        .fill(Color.Took.veryDarkGray)
                        .cornerRadius(10, corners: [.topLeft, .topRight])
                        .frame(height: 96)

                    HStack {
                        Spacer()

                        MainTabItemView(.tabHome, text: "내 명함", isSelected: selection == 0)
                            .onTapGesture {
                                withAnimation {
                                    selection = 0
                                }
                            }

                        Spacer()

                        TookIcon(
                            .selectedCard,
                            width: 76,
                            height: 76,
                            renderingMode: .original
                        )
                        .offset(y: -30)

                        Spacer()

                        MainTabItemView(.tabCardList, text: "명함목록", isSelected: selection == 1)
                            .onTapGesture {
                                withAnimation {
                                    selection = 1
                                }
                            }

                        Spacer()
                    }
                    .padding(.bottom)
                    .frame(height: 96)
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

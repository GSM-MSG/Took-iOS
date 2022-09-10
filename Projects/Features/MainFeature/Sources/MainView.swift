import SwiftUI
import DesignSystem

public struct MainView: View {
    @State var selection: Int = 0
    @Namespace var cardAnimation
    let tabList: [(TookIcon.Icon, String)] = [
        (.tabHome, "내 명함"),
        (.card, "명함 교환"),
        (.tabCardList, "명함 목록")
    ]

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

                        if selection == 1 {
                            TookIcon(
                                .selectedCard,
                                width: 76,
                                height: 76,
                                renderingMode: .original
                            )
                            .offset(y: -30)
                            .transition(.offset(y: 30).combined(with: .opacity))
                        } else {
                            MainTabItemView(.card, text: "명함 교환", isSelected: selection == 1)
                                .transition(.opacity)
                                .onTapGesture {
                                    withAnimation {
                                        selection = 1
                                    }
                                }
                        }

                        Spacer()

                        MainTabItemView(.tabCardList, text: "명함목록", isSelected: selection == 2)
                            .onTapGesture {
                                withAnimation {
                                    selection = 2
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

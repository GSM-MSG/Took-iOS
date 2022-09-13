import SwiftUI
import DesignSystem

public struct IntroView: View {
    public init() {}

    public var body: some View {
        NavigationView {
            ZStack {
                TookImage(.background)
                    .ignoresSafeArea()
                VStack(spacing: 16) {
                    Spacer()
                    TookButton(text: "회원가입", style: .default)
                    TookButton(text: "로그인", style: .outline)
                        .padding(.bottom, 44)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        IntroView()
    }
}

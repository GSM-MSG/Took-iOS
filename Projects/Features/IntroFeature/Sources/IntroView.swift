import SwiftUI
import DesignSystem
import SignupFeature

public struct IntroView: View {
    let signupComponent: SignupComponent
    @State var isNavigateSignup = false
    @State var isNavigateSignin = false

    public init(
        signupComponent: SignupComponent
    ) {
        self.signupComponent = signupComponent
    }

    public var body: some View {
        NavigationView {
            ZStack {
                TookImage(.background)
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    Spacer()
                    TookButton(text: "회원가입", style: .default) {
                        isNavigateSignup.toggle()
                    }

                    TookButton(text: "로그인", style: .outline) {
                        isNavigateSignin.toggle()
                    }
                }
                .padding(.bottom, 44)
                .padding(.horizontal, 16)
            }
            .navigate(to: signupComponent.makeView(), when: $isNavigateSignup)
            .navigate(to: Text("Signin"), when: $isNavigateSignin)
        }
    }
}

import SwiftUI
import DesignSystem
import VerifyFeature

public struct SignupView: View {
    private enum FocusField: Hashable {
        case email
        case password
    }

    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss
    private let verifyComponent: VerifyComponent

    public init(
        viewModel: SignupViewModel,
        verifyComponent: VerifyComponent
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.verifyComponent = verifyComponent
    }

    public var body: some View {
        ZStack {
            TookImage(.background)
                .ignoresSafeArea()

            VStack(spacing: 24) {
                TookTextField(
                    "이메일",
                    placeholderText: "이메일을 입력해주세요.",
                    text: $viewModel.emailText,
                    isError: viewModel.isError
                ) {
                    focusField = .password
                }
                .focused($focusField, equals: .email)

                SecureTookTextField(
                    "비밀번호",
                    placeholderText: "비밀번호를 입력해주세요.",
                    text: $viewModel.passwordText,
                    isError: viewModel.isError,
                    errorText: viewModel.errorMessage
                )
                .focused($focusField, equals: .password)

                Spacer()

                VStack(spacing: 16) {
                    TookButton(text: "회원가입", style: .default) {
                        Task {
                            await viewModel.signup()
                        }
                    }
                    .disabled(viewModel.isFormEmpty)

                    NavigationLink {
                        Text("Signin")
                    } label: {
                        Text("이미 계정이 있으신가요? 로그인")
                            .tookTypo(.regular(.small), color: .Took.gray)
                    }
                }
                .padding(.bottom, 14)
            }
            .padding(.horizontal, 16)
            .padding(.top, 32)
        }
        .configBackButton(willDismiss: {
            viewModel.isPresentedTerms = false
        }, dismiss: dismiss)
        .adaptiveSheet(isPresented: $viewModel.isPresentedTerms, detents: [.medium(), .large()]) {
            TermsView {
                viewModel.isPresentedTerms = false
                viewModel.isNavigateToVerify.toggle()
            }
        }
        .onAppear {
            focusField = .email
        }
        .navigationTitle("회원가입")
        .navigationBarTitleDisplayMode(.inline)
        .navigate(to: DeferView({
            verifyComponent.makeView(email: viewModel.emailText) {
                print("A")
            }
        }), when: $viewModel.isNavigateToVerify)
    }
}

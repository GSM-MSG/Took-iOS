import SwiftUI
import DesignSystem

public struct SignupView: View {
    private enum FocusField: Hashable {
        case email
        case password
    }

    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?
    @Environment(\.dismiss) var dismiss

    public init(viewModel: SignupViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
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
        .configBackButton(dismiss: dismiss)
        .adaptiveSheet(isPresented: $viewModel.isPresentedTerms, detents: [.medium()], content: {
            termsSheetView()
        })
        .onAppear {
            focusField = .email
        }
        .navigationTitle("회원가입")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    func termsSheetView() -> some View {
        VStack {
            Text("Terms")
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewModel: SignupViewModel())
    }
}

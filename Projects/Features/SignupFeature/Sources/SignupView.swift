import SwiftUI
import DesignSystem

public struct SignupView: View {
    private enum FocusField: Hashable {
        case email
        case password
    }

    @StateObject var viewModel: SignupViewModel
    @FocusState private var focusField: FocusField?

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

                TookTextField(
                    "비밀번호",
                    placeholderText: "비밀번호를 입력해주세요.",
                    text: $viewModel.passwordText,
                    isError: viewModel.isError,
                    errorText: viewModel.errorMessage
                )
                .focused($focusField, equals: .password)

                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 32)
        }
        .navigationTitle("회원가입")
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewModel: SignupViewModel())
    }
}

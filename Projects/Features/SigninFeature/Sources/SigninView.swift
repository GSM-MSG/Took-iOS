import SwiftUI
import DesignSystem
import ErrorModule

public struct SigninView: View {
    private enum FocusField: Hashable {
        case email
        case password
    }

    @StateObject var viewModel: SigninViewModel
//    @FocusState private var focusField: FocusField?

    public init(viewModel: SigninViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ZStack {
            TookImage(.background)
                .ignoresSafeArea()
                .zIndex(0)
            VStack {
                TookTextField(
                    "이메일",
                    placeholderText: "이메일을 입력해 주세요.",
                    text: $viewModel.emailText,
                    isError: false
                )
//                .focused($focusField, equals: .email)
                .padding(.top, 32)

                SecureTookTextField(
                    "비밀번호",
                    placeholderText: "비밀번호를 입력해 주세요.",
                    text: $viewModel.passwordText,
                    isError: false,
                    errorText: "이메일 또는 비밀번호가 잘못되었습니다."
                )
//                .focused($focusField, equals: .password)
                .padding(.top, 24)

                Spacer()
                TookButton(text: "로그인")
                    .tookTypo(.medium(.medium))
                    .padding(.bottom, 16)
                    .disabled(viewModel.isFormEmpty)
                HStack {
                    NavigationLink {
                        Text("login")
                    } label: {
                        Text("비밀번호 찾기")
                            .tookTypo(.regular(.small), color: .Took.gray)
                    }
                    Divider()
                        .frame(width: 1, height: 8)
                        .overlay(Color.Took.gray)
                    NavigationLink {
                        Text("login")
                    } label: {
                        Text("회원가입")
                            .tookTypo(.regular(.small), color: .Took.gray)
                    }
                }

            }
        }
        .navigationTitle("로그인")
        .navigationBarTitleDisplayMode(.inline)
    }
}

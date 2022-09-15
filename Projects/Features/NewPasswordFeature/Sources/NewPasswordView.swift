import SwiftUI
import DesignSystem

public struct NewPasswordView: View {

    @StateObject var viewModel: NewPasswordViewModel

    public init(viewModel: NewPasswordViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    public var body: some View {
        ZStack {
            TookImage(.background)
                .ignoresSafeArea()
                .zIndex(0)
            VStack {
                TookTextField("이메일",
                              placeholderText: "이메일을 입력해 주세요.",
                              text: $viewModel.emailText,
                              isError: viewModel.isError,
                              errorText: viewModel.errorMessage
                ).padding(.top, 32)
                Spacer()
                TookButton(text: "확인")
                    .tookTypo(.medium(.medium))
                    .padding(.bottom, 16)
                    .disabled(viewModel.emailText.isEmpty)
            }
        }
        .navigationTitle("비밀번호 재설정")
        .navigationBarTitleDisplayMode(.inline)
    }
}

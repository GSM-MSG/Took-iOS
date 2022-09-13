import SwiftUI
import DesignSystem

public struct SignupView: View {
    @StateObject var viewModel: SignupViewModel

    public init(
        viewModel: SignupViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        ZStack {
            TookImage(.background)

            VStack {
                TookTextField("이메일", placeholderText: "이메일을 입력해주세요.", text: $viewModel.emailText)
            }
        }
        .navigationTitle("회원가입")
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewModel: SignupViewModel())
    }
}

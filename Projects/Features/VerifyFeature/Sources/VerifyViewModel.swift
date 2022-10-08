import Combine
import DomainModule
import ErrorModule
import BaseFeature

public final class VerifyViewModel: BaseViewModel {
    private let email: String
    private let sendEmailUseCase: any SendEmailUseCase
    private let emailVerifyUseCase: any EmailVerifyUseCase

    public init(
        email: String,
        sendEmailUseCase: any SendEmailUseCase,
        emailVerifyUseCase: any EmailVerifyUseCase
    ) {
        self.email = email
        self.sendEmailUseCase = sendEmailUseCase
        self.emailVerifyUseCase = emailVerifyUseCase
        super.init()
    }

    @Published var otpText = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 4)
    @Published var isVerifySuccess = false

    func onAppear() async {
        await withAsyncTry(with: self) { owner in
            try await owner.sendEmailUseCase.execute(email: owner.email)
        }
    }

    func verify() async {
        await withAsyncTry(with: self) { owner in
            try await owner.emailVerifyUseCase.execute(email: owner.email, code: owner.otpText)
            owner.isVerifySuccess = true
        }
    }
}

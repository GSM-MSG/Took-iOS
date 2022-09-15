import Combine
import DomainModule
import ErrorModule

public final class VerifyViewModel: ObservableObject {
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
    }

    @Published var isLoading = false
    @Published var otpText = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 4)
    @Published var isError = false
    @Published var errorMessage = ""
    @Published var isVerifySuccess = false

    @MainActor
    func onAppear() async {
        do {
            try await sendEmailUseCase.execute(email: email)
        } catch {
            isError = true
            errorMessage = error.asTookError.localizedDescription
        }
    }
}

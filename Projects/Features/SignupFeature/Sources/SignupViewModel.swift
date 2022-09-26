import Combine
import CommonFeature

public final class SignupViewModel: BaseViewModel {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var isPresentedTerms = false
    @Published var isNavigateToVerify = false
    var isFormEmpty: Bool {
        emailText.isEmpty || passwordText.isEmpty
    }

    @MainActor
    func signup() async {
        isPresentedTerms = true
    }
}

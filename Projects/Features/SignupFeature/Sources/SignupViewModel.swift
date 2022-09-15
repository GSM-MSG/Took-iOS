import Combine

public final class SignupViewModel: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    @Published var isPresentedTerms = false
    @Published var isNavigateToVerify = false
    var isFormEmpty: Bool {
        emailText.isEmpty || passwordText.isEmpty
    }

    public init() {}

    @MainActor
    func signup() async {
        isPresentedTerms = true
    }
}

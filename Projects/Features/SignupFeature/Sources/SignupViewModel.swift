import Combine

public final class SignupViewModel: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var isAgreedAllTerms = false
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    @Published var isPresentedTerms = false
    var isFormEmpty: Bool {
        emailText.isEmpty || passwordText.isEmpty
    }

    public init() {}

    func signup() async {
        isPresentedTerms = true
    }
}

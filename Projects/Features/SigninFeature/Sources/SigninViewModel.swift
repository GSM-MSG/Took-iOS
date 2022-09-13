import Combine

public final class SigninViewModel: ObservableObject {
    public init() {}
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
    var isFormEmpty: Bool {
        emailText.isEmpty || passwordText.isEmpty
    }
}

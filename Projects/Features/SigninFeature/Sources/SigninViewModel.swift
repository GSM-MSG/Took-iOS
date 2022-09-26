import Combine

public final class SigninViewModel: ObservableObject {
    public init() {}
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    var isFormEmpty: Bool {
        emailText.isEmpty || passwordText.isEmpty
    }
}

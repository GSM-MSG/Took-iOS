import Combine

public final class SignupViewModel: ObservableObject {
    @Published var emailText: String = ""
    @Published var passwordText: String = ""
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""

    public init() {}
}

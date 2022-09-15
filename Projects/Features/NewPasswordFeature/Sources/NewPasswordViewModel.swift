import Combine

public final class NewPasswordViewModel: ObservableObject {
    public init() {}
    @Published var emailText: String = ""
    @Published var isError: Bool = false
    @Published var errorMessage: String = ""
}

import Combine

public final class VerifyViewModel: ObservableObject {
    public init() {}
    @Published var isLoading = false
    @Published var otpText = ""
    @Published var otpFields: [String] = Array(repeating: "", count: 4)
    @Published var isError = false
    @Published var errorMessage = ""
    @Published var isVerifySuccess = false
}

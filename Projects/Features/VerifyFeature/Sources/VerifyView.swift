import SwiftUI
import DesignSystem

public struct VerifyView: View {
    private enum OTPFocusField: CaseIterable {
        case field1
        case field2
        case field3
        case field4
    }

    @StateObject var viewModel: VerifyViewModel
    @Environment(\.dismiss) var dismiss
    @FocusState private var activeFocus: OTPFocusField?
    private let action: () -> Void

    public init(
        viewModel: VerifyViewModel,
        action: @escaping () -> Void = {}
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.action = action
    }

    public var body: some View {
        ZStack {
            TookImage(.background)
                .ignoresSafeArea()

            VStack(spacing: 16) {
                Text("입력하신 이메일로\n인증번호가 발송되었습니다.")
                    .tookTypo(.regular(.large), color: .Took.lightGray)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.top, 96)

                otpTextField()

                Spacer()

                TookButton(text: "인증하기")
                    .padding(.bottom, 44)
            }

            if viewModel.isLoading {
                ZStack {
                    Color.Took.black.opacity(0.4)

                    ProgressView()
                        .progressViewStyle(.circular)
                }
            }
        }
        .task {
            await viewModel.onAppear()
        }
        .navigationTitle("인증번호")
        .navigationBarTitleDisplayMode(.inline)
        .configBackButton(dismiss: dismiss)
        .onChange(of: viewModel.otpFields) { newValue in
            otpCondition(value: newValue)
        }
        .onChange(of: viewModel.isVerifySuccess) { newValue in
            if newValue { action() }
        }
    }
}

// MARK: - Methoc
private extension VerifyView {
    func otpCondition(value: [String]) {
        for index in OTPFocusField.allCases.indices where value[index].count == OTPFocusField.allCases.count {
            DispatchQueue.main.async {
                viewModel.otpText = value[index]
                viewModel.otpFields[index] = ""
            }

            viewModel.otpText.enumerated().forEach {
                viewModel.otpFields[$0.offset] = String($0.element)
            }
            return
        }

        // Moving when typing
        for index in 0..<OTPFocusField.allCases.count - 1 {
            if value[index].count == 1 && OTPFocusField.allCases[index] == activeFocus {
                activeFocus = OTPFocusField.allCases[index + 1]
            }
        }

        // Moving back when removing
        for index in 1..<OTPFocusField.allCases.count {
            if value[index].isEmpty && !value[index - 1].isEmpty {
                activeFocus = OTPFocusField.allCases[index - 1]
            }
        }

        for index in OTPFocusField.allCases.indices where value[index].count > 1 {
            viewModel.otpFields[index] = String(value[index].last ?? Character(""))
        }
    }

    @ViewBuilder
    func otpTextField() -> some View {
        HStack(spacing: 16) {
            ForEach(OTPFocusField.allCases.indices, id: \.self) { index in
                TextField("", text: $viewModel.otpFields[index])
                    .accentColor(.clear)
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                    .multilineTextAlignment(.center)
                    .focused($activeFocus, equals: OTPFocusField.allCases[index])
                    .frame(width: 48, height: 48)
                    .background {
                        Color.Took.veryDarkGray
                    }
                    .overlay {
                        if OTPFocusField.allCases[index] == activeFocus {
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(RadialGradient.primary, lineWidth: 1)
                        } else {
                            RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(Color.Took.strok, lineWidth: 1)
                        }
                    }
                    .cornerRadius(16)
            }
        }
    }
}

import SwiftUI

public struct SecureTookTextField: View {
    var labelText: String
    var placeholderText: String
    @Binding var text: String
    var isError: Bool
    var errorText: String
    var onCommit: () -> Void
    @FocusState var isFocus: Bool
    @State var isSecure = true

    public init(
        _ labelText: String = "",
        placeholderText: String = "",
        text: Binding<String>,
        isError: Bool = false,
        errorText: String = "",
        onCommit: @escaping () -> Void = {}
    ) {
        self.labelText = labelText
        self.placeholderText = placeholderText
        self._text = text
        self.isError = isError
        self.errorText = errorText
        self.onCommit = onCommit
    }

    public var body: some View {
        VStack(alignment: .leading) {
            if !labelText.isEmpty {
                Text(labelText)
                    .foregroundColor(Color.Took.lightGray)
                    .tookTypo(.semibold(.medium))
            }
            Group {
                if isSecure {
                    SecureField("", text: $text)
                } else {
                    TextField("", text: $text)
                }
            }
            .padding()
            .foregroundColor(Color.Took.white)
            .modifier(TookTextFieldSecureModifier(isSecure: $isSecure))
            .modifier(PlaceholderStyle(showPlaceholder: text.isEmpty, placeholder: placeholderText))
            .background(Color.Took.transparencyBoxBg)
            .onSubmit(onCommit)
            .cornerRadius(16)
            .focused($isFocus)
            .overlay {
                if isFocus {
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(RadialGradient.primary)
                } else if isError {
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(Color.Took.error)
                } else {
                    RoundedRectangle(cornerRadius: 16)
                        .strokeBorder(Color.Took.darkGray)
                }
                if isError && !errorText.isEmpty {
                    Label {
                        Text(errorText)
                            .tookTypo(.regular(.small))
                    } icon: {
                        Image(systemName: "exclamationmark.circle")
                    }
                    .foregroundColor(Color.Took.error)
                }
            }
        }
    }
}

struct TookTextFieldSecureModifier: ViewModifier {
    @Binding var isSecure: Bool

    func body(content: Content) -> some View {
        ZStack {
            content
            HStack {
                Spacer()
                Button {
                    isSecure.toggle()
                } label: {
                    Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                        .foregroundColor(.Took.gray)
                }
                .padding()
            }
        }
    }
}

import SwiftUI

public struct TookTextField: View {
    var labelText: String
    var placeholderText: String
    @Binding var text: String
    var isError: Bool
    var errorText: String
    var onCommit: () -> Void
    @FocusState var isFocus: Bool

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
            TextField("", text: $text)
                .tookTypo(.regular(.large))
                .padding()
                .foregroundColor(Color.Took.white)
                .modifier(TookTextFieldClearModifier(text: $text))
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

struct TookTextFieldClearModifier: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        HStack {
            content
            if !text.isEmpty {
                Button(
                    action: { self.text = "" },
                    label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(Color.Took.gray)
                    }
                )
                .padding(.trailing)
            }
        }
    }
}

struct PlaceholderStyle: ViewModifier {
    var showPlaceholder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceholder {
                Text(placeholder)
                    .foregroundColor(Color.Took.darkGray)
                    .padding()
            }
            content
        }
    }
}

public struct TookTextField_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            ZStack {
                TookImage(.background)
                    .ignoresSafeArea()

                ScrollView {
                    TookTextField(
                        "제목입니당",
                        placeholderText: "뭐라도 입력해주세요",
                        text: .constant(""),
                        isError: false
                    )

                    TookTextField(
                        "제목입니당",
                        placeholderText: "뭐라도 입력해주세요",
                        text: .constant("123123123312113"),
                        isError: false
                    )

                    TookTextField(
                        "제목입니당",
                        placeholderText: "뭐라도 입력해주세요",
                        text: .constant(""),
                        isError: false
                    )

                    TookTextField(
                        "제목입니당",
                        placeholderText: "뭐라도 입력해주세요",
                        text: .constant(""),
                        isError: true,
                        errorText: "안녕하세요"
                    )
                }
                .padding()
            }
            .previewInterfaceOrientation(.portrait)
        }
    }
}

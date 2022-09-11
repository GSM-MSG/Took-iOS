import SwiftUI

public struct TookTextField: View {
    var textFieldHeader: String
    var placeHolderText: String
    var isError: Bool
    var buttonAction: () -> Void
    var onCommit: () -> Void
    @FocusState var ifFocus: Bool
    @Binding var text: String
    var errorText: String

    public init(
        _ textFieldHeader: String = "",
        _ placeHolderText: String = "",
        isError: Bool = false,
        buttonAction: @escaping () -> Void = {},
        onCommit: @escaping () -> Void = {},
        text: Binding<String>,
        errorText: String = ""
    ) {
        self.textFieldHeader = textFieldHeader
        self.placeHolderText = placeHolderText
        self.isError = isError
        self.buttonAction = buttonAction
        self.onCommit = onCommit
        self._text = text
        self.errorText = errorText
    }

    public var body: some View {
        HStack {
            Text(textFieldHeader)
                .foregroundColor(Color.Took.gray)
                .tookTypo(.bold(.medium))
            Spacer()
        }
        TextField("", text: $text)
            .padding()
            .foregroundColor(Color.Took.white)
            .modifier(TookTextFieldClearModifier(text: $text))
            .modifier(PlaceholderStyle( placeholder: placeHolderText))
            .background(Color.Took.transparencyBoxBg)
            .onSubmit(onCommit)
            .cornerRadius(16)
            .focused($ifFocus)
            .overlay {
                if ifFocus {
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
        HStack {
            if isError == true {
                Label {
                    Text(errorText)
                        .tookTypo(.regular(.small))
                        .foregroundColor(Color.Took.error)
                } icon: {
                    Image(systemName: "exclamationmark.circle")
                        .foregroundColor(Color.Took.error)
                }
                .padding(
                    EdgeInsets(
                        top: 0,
                        leading: 10,
                        bottom: 0,
                        trailing: 0
                    )
                )
            }
            Spacer()
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
public struct PlaceholderStyle: ViewModifier {
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .foregroundColor(Color.Took.darkGray)
                .padding()
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
                    TookTextField("제목입니당", "뭐라도 입력해주세요", isError: false, text: .constant(""))
                    TookTextField("제목입니당", "뭐라도 입력해주세요", isError: false, text: .constant("123123123312113"))
                    TookTextField("제목입니당", "뭐라도 입력해주세요", isError: false, text: .constant(""))
                    TookTextField("제목입니당", "뭐라도 입력해주세요", isError: true, text: .constant(""), errorText: "안녕하세요")
                }
                .padding()
            }
        }
    }
}

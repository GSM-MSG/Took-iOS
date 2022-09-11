import SwiftUI

public struct TookTextField: View {
    var placeHolderText: String
    var isError: Bool
    var buttonAction: () -> Void
    var onCommit: () -> Void
    @FocusState var ifFocus: Bool
    @Binding var text: String

    public init(
        _ placeHolderText: String = "",
        isError: Bool = false,
        buttonAction: @escaping () -> Void = {},
        onCommit: @escaping () -> Void = {},
        text: Binding<String>
    ) {
        self.placeHolderText = placeHolderText
        self.isError = isError
        self.buttonAction = buttonAction
        self.onCommit = onCommit
        self._text = text
    }

    public var body: some View {
        VStack {
            TextField("", text: $text)
                .padding()
                .foregroundColor(Color.Took.white)
                .modifier(TookTextFieldClearModifier(text: $text))
                .modifier(PlaceholderStyle( placeholder: placeHolderText))
                .background(Color.Took.transparencyBoxBg)
                .overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color.Took.darkGray))
                .onSubmit(onCommit)
                .focused($ifFocus)
                .cornerRadius(16)
                .if(ifFocus) {
                    $0.overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(RadialGradient.primary))
                }
                .if(isError) {
                    $0.overlay(RoundedRectangle(cornerRadius: 16).strokeBorder(Color.Took.error))
                }
        }.padding()
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
                    TookTextField("뭐라도 입력해주세요", isError: false, text: .constant(""))
                    TookTextField("뭐라도 입력해주세요", isError: false, text: .constant("123123123312113"))
                    TookTextField("뭐라도 입력해주세요", isError: false, text: .constant(""))
                    TookTextField("뭐라도 입력해주세요", isError: true, text: .constant(""))
                }
                .padding()
            }
        }
    }
}

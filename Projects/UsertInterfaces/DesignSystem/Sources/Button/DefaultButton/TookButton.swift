import SwiftUI

public struct TookButton: View {
    public enum Style {
        case `default`, outline
    }

    public var text: String
    public var action: () -> Void
    public var style: Style

    public init(
        text: String = "",
        style: Style = .default,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.style = style
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
                Spacer()
                Text(text)
                    .padding(20)
                Spacer()
            }
        }
        .style(style)
    }
}

struct TookButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TookButton(text: "Text")
                .padding(.horizontal, 16)
            TookButton(text: "Text")
                .padding(.horizontal, 16)
                .disabled(true)
            TookButton(text: "Text", style: .outline)
                .padding(.horizontal, 16)
        }
        .padding()
        .background(Color.Took.black)
    }
}

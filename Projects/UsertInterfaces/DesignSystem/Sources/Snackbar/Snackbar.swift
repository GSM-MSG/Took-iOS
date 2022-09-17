import SwiftUI

public struct Snackbar: ViewModifier {
    public enum Style {
        case success
        case failure
    }

    @Binding var isShowing: Bool
    var text: String
    var style: Style

    public init(
        isShowing: Binding<Bool>,
        text: String,
        style: Style
    ) {
        _isShowing = isShowing
        self.text = text
        self.style = style
    }

    public func body(content: Content) -> some View {
        ZStack {
            content

            snackbarView()
                .zIndex(0)
        }
    }

    @ViewBuilder
    func snackbarView() -> some View {
        VStack {
            Spacer()

            if isShowing {
                HStack {
                    Spacer()

                    HStack(spacing: 9) {
                        Image(systemName: style.systemIcon)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(style.foregroundColor)

                        Text(text)
                            .tookTypo(.medium(.medium), color: style.foregroundColor)
                    }
                    .padding(15.5)

                    Spacer()
                }
                .cornerRadius(8)
                .background {
                    Color.Took.white
                        .cornerRadius(8)
                        .shadow(color: .Took.black.opacity(0.07), radius: 1, y: 0.4)
                }
                .padding(.bottom, 16)
                .padding(.horizontal, 16)
                .transition(.opacity.animation(.easeOut(duration: 0.3)))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
            }
        }
    }
}

public extension Snackbar.Style {
    var systemIcon: String {
        switch self {
        case .success:
            return "checkmark.circle"

        case .failure:
            return "exclamationmark.circle"
        }
    }

    var foregroundColor: Color {
        switch self {
        case .success:
            return .Took.systemGreen

        case .failure:
            return .Took.error
        }
    }
}

public extension View {
    func snackbar(
        isShowing: Binding<Bool>,
        text: String,
        style: Snackbar.Style
    ) -> some View {
        self
            .modifier(Snackbar(isShowing: isShowing, text: text, style: style))
    }
}

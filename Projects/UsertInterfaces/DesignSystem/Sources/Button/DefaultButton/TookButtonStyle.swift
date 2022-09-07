import SwiftUI

struct TookButtonStyle: ButtonStyle {
    var style: TookButton.Style

    func makeBody(configuration: Configuration) -> some View {
        switch style {
        case .`default`:
            return AnyView(DefaultButton(configuration: configuration))
        case .outline:
            return AnyView(OutlineButton(configuration: configuration))
        }
    }
}

// MARK: - Usage
extension Button {
    func style(_ style: TookButton.Style) -> some View {
        self.buttonStyle(TookButtonStyle(style: style))
    }
}

// MARK: - Default
extension TookButtonStyle {
    struct DefaultButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .tookTypo(.medium(.medium), color: .Took.white)
                .background(RadialGradient.primary)
                .if(!isEnabled) { $0.blendMode(.luminosity) }
                .cornerRadius(16)
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
}

// MARK: - Outline
extension TookButtonStyle {
    struct OutlineButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool

        var body: some View {
            configuration.label
                .tookTypo(.medium(.medium), color: .Took.white)
                .background(.clear)
                .cornerRadius(16)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(isEnabled ? Color.Took.white : .Took.white.opacity(0.7), lineWidth: 1)
                )
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
}

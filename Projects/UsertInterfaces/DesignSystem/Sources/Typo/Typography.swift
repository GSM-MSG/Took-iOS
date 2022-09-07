import SwiftUI
// swiftlint:disable identifier_name nesting function_body_length
public struct TookTypography: ViewModifier {
    public enum Style {
        case regular(Regular)
        case medium(Medium)
        case bold(Bold)

        public enum Regular: CGFloat {
            case small = 12
            case medium = 14
            case large = 16
            case extraLarge = 20
        }
        public enum Medium: CGFloat {
            case small = 12
            case medium = 14
            case large = 16
            case extraLarge = 20
        }
        public enum Bold: CGFloat {
            case small = 12
            case medium = 14
            case large = 16
            case extraLarge = 20
        }

    }

    var style: Style

    public func body(content: Content) -> some View {
        switch style {
        case let .regular(reg):
            return content.font(.system(size: reg.rawValue, weight: .regular))
        case let .medium(reg):
            return content.font(.system(size: reg.rawValue, weight: .medium))
        case let .bold(reg):
            return content.font(.system(size: reg.rawValue, weight: .bold))
        }
    }
}

public extension View {
    func tookType(_ style: TookTypography.Style) -> some View {
        self.modifier(TookTypography(style: style))
    }
}

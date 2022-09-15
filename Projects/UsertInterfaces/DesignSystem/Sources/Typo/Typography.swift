import SwiftUI
// swiftlint:disable nesting
public struct TookTypography: ViewModifier {
    public enum Style {
        case regular(Regular)
        case medium(Medium)
        case semibold(Semibold)

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
        public enum Semibold: CGFloat {
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
        case let .semibold(reg):
            return content.font(.system(size: reg.rawValue, weight: .semibold))
        }
    }
}

public extension View {
    func tookTypo(_ style: TookTypography.Style) -> some View {
        self.modifier(TookTypography(style: style))
    }
    func tookTypo(_ style: TookTypography.Style, color: Color) -> some View {
        self.modifier(TookTypography(style: style))
            .foregroundColor(color)
    }
}

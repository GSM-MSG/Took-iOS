import SwiftUI

extension DesignSystemColors {
    var suiColor: SwiftUI.Color {
        SwiftUI.Color(uiColor: color)
    }
}

public extension Color {
    enum Took {}
}

public extension Color.Took {
    static let white = DesignSystemAsset.Colors.white.suiColor
    static let lightGray = DesignSystemAsset.Colors.lightGray.suiColor
    static let gray = DesignSystemAsset.Colors.gray.suiColor
    static let darkGray = DesignSystemAsset.Colors.darkGray.suiColor
    static let veryDarkGray = DesignSystemAsset.Colors.veryDarkGray.suiColor
    static let veryVeryDarkGray = DesignSystemAsset.Colors.veryVeryDarkGray.suiColor
    static let black = DesignSystemAsset.Colors.black.suiColor
    static let strok = DesignSystemAsset.Colors.strok.suiColor
    static let transparencyBoxBg = DesignSystemAsset.Colors.transparencyBoxBg.suiColor
    static let error = DesignSystemAsset.Colors.error.suiColor
}

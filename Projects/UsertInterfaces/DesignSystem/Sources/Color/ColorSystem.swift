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
    static let white = DesignSystemAsset.white.suiColor
    static let lightGray = DesignSystemAsset.lightGray.suiColor
    static let gray = DesignSystemAsset.gray.suiColor
    static let darkGray = DesignSystemAsset.darkGray.suiColor
    static let veryDarkGray = DesignSystemAsset.veryDarkGray.suiColor
    static let veryVeryDarkGray = DesignSystemAsset.veryVeryDarkGray.suiColor
    static let black = DesignSystemAsset.black.suiColor
    static let strok = DesignSystemAsset.strok.suiColor
    static let transparencyBoxBg = DesignSystemAsset.transparencyBoxBg.suiColor
}

// swiftlint:disable all
// swift-format-ignore-file
// swiftformat:disable all
// Generated using tuist — https://github.com/tuist/tuist

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum DesignSystemAsset {
  public enum Colors {
    public static let black = DesignSystemColors(name: "Black")
    public static let darkGray = DesignSystemColors(name: "DarkGray")
    public static let error = DesignSystemColors(name: "Error")
    public static let gray = DesignSystemColors(name: "Gray")
    public static let lightGray = DesignSystemColors(name: "LightGray")
    public static let strok = DesignSystemColors(name: "Strok")
    public static let systemGreen = DesignSystemColors(name: "SystemGreen")
    public static let transparencyBoxBg = DesignSystemColors(name: "TransparencyBoxBg")
    public static let veryDarkGray = DesignSystemColors(name: "VeryDarkGray")
    public static let veryVeryDarkGray = DesignSystemColors(name: "VeryVeryDarkGray")
    public static let white = DesignSystemColors(name: "White")
  }
  public enum Icons {
    public static let card = DesignSystemImages(name: "Card")
    public static let gear = DesignSystemImages(name: "Gear")
    public static let horizontal = DesignSystemImages(name: "Horizontal")
    public static let selectedCard = DesignSystemImages(name: "SelectedCard")
    public static let tabCardList = DesignSystemImages(name: "TabCardList")
    public static let tabHome = DesignSystemImages(name: "TabHome")
    public static let vertical = DesignSystemImages(name: "Vertical")
  }
  public enum Images {
    public static let background = DesignSystemImages(name: "Background")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class DesignSystemColors {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  public private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension DesignSystemColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: DesignSystemColors) {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

public struct DesignSystemImages {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = DesignSystemResources.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let image = bundle.image(forResource: NSImage.Name(name))
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

public extension DesignSystemImages.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the DesignSystemImages.image property")
  convenience init?(asset: DesignSystemImages) {
    #if os(iOS) || os(tvOS)
    let bundle = DesignSystemResources.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:enable all
// swiftformat:enable all

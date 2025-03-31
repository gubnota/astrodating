// swiftlint:disable:this file_name
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
#if canImport(SwiftUI)
  import SwiftUI
#endif

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum AstroDatingAsset: Sendable {
  public enum Assets {
  public static let accentColor = AstroDatingColors(name: "AccentColor")
    public static let astroSign = AstroDatingData(name: "astroSign")
    public static let badHabits = AstroDatingData(name: "badHabits")
    public static let checkbox = AstroDatingImages(name: "checkbox")
    public static let checkboxTrue = AstroDatingImages(name: "checkbox_true")
    public static let p01 = AstroDatingImages(name: "p01")
    public static let p02 = AstroDatingImages(name: "p02")
    public static let p03 = AstroDatingImages(name: "p03")
    public static let p04 = AstroDatingImages(name: "p04")
    public static let p05 = AstroDatingImages(name: "p05")
    public static let pattern = AstroDatingImages(name: "pattern")
    public static let user1 = AstroDatingImages(name: "user1")
    public static let user10 = AstroDatingImages(name: "user10")
    public static let user11 = AstroDatingImages(name: "user11")
    public static let user12 = AstroDatingImages(name: "user12")
    public static let user2 = AstroDatingImages(name: "user2")
    public static let user3 = AstroDatingImages(name: "user3")
    public static let user4 = AstroDatingImages(name: "user4")
    public static let user5 = AstroDatingImages(name: "user5")
    public static let user6 = AstroDatingImages(name: "user6")
    public static let user7 = AstroDatingImages(name: "user7")
    public static let user8 = AstroDatingImages(name: "user8")
    public static let user9 = AstroDatingImages(name: "user9")
  }
  public enum PreviewAssets {
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public final class AstroDatingColors: Sendable {
  public let name: String

  #if os(macOS)
  public typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  public var color: Color {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIColor: SwiftUI.Color {
      return SwiftUI.Color(asset: self)
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

public extension AstroDatingColors.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, visionOS 1.0, *)
  convenience init?(asset: AstroDatingColors) {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Color {
  init(asset: AstroDatingColors) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }
}
#endif

public struct AstroDatingData: Sendable {
  public let name: String

  #if os(iOS) || os(tvOS) || os(macOS) || os(visionOS)
  @available(iOS 9.0, macOS 10.11, visionOS 1.0, *)
  public var data: NSDataAsset {
    guard let data = NSDataAsset(asset: self) else {
      fatalError("Unable to load data asset named \(name).")
    }
    return data
  }
  #endif
}

#if os(iOS) || os(tvOS) || os(macOS) || os(visionOS)
@available(iOS 9.0, macOS 10.11, visionOS 1.0, *)
public extension NSDataAsset {
  convenience init?(asset: AstroDatingData) {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
    self.init(name: asset.name, bundle: bundle)
    #elseif os(macOS)
    self.init(name: NSDataAsset.Name(asset.name), bundle: bundle)
    #endif
  }
}
#endif

public struct AstroDatingImages: Sendable {
  public let name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS) || os(visionOS)
  public typealias Image = UIImage
  #endif

  public var image: Image {
    let bundle = Bundle.module
    #if os(iOS) || os(tvOS) || os(visionOS)
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

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, visionOS 1.0, *)
public extension SwiftUI.Image {
  init(asset: AstroDatingImages) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle)
  }

  init(asset: AstroDatingImages, label: Text) {
    let bundle = Bundle.module
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: AstroDatingImages) {
    let bundle = Bundle.module
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:enable all
// swiftformat:enable all

import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: [
        .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.19.0")),
        .remote(url: "https://github.com/onevcat/Kingfisher.git", requirement: .upToNextMajor(from: "7.3.2"))
    ],
    platforms: [.iOS]
)

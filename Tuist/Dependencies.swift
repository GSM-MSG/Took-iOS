import ProjectDescription

let dependencies = Dependencies(
    carthage: nil,
    swiftPackageManager: [
        .remote(url: "https://github.com/uber/needle.git", requirement: .upToNextMajor(from: "0.19.0"))
    ],
    platforms: [.iOS]
)

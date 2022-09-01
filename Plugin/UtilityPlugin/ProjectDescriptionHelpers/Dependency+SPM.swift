
import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Swinject = TargetDependency.package(product: "Swinject")
}

public extension Package {
    static let Swinject = Package.remote(url: "https://github.com/Swinject/Swinject", requirement: .upToNextMajor(from: "2.8.2"))
}

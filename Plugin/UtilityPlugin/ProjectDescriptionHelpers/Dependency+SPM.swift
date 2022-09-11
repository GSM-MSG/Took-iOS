import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
}

public extension Package {
}

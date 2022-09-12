import ProjectDescription

public extension TargetDependency {
    struct SPM {}
}

public extension TargetDependency.SPM {
    static let Needle = TargetDependency.external(name: "NeedleFoundation")
    static let Kingfisher = TargetDependency.external(name: "Kingfisher")
    static let Moya = TargetDependency.external(name: "Moya")
}

public extension Package {
}

import ProjectDescription

// swiftlint:disable nesting
public extension TargetDependency {
    struct Project {
        public struct Features {}
        public struct Module {}
        public struct Service {}
        public struct UserInterfaces {}
    }
}

public extension TargetDependency.Project.Features {
    static let NewCardFeature = TargetDependency.feature(name: "NewCardFeature")
    static let SettingFeature = TargetDependency.feature(name: "SettingFeature")
    static let CardListFeature = TargetDependency.feature(name: "CardListFeature")
    static let CardFeature = TargetDependency.feature(name: "CardFeature")
    static let MainFeature = TargetDependency.feature(name: "MainFeature")
    static let VerifyFeature = TargetDependency.feature(name: "VerifyFeature")
    static let SignupFeature = TargetDependency.feature(name: "SignupFeature")
    static let SigninFeature = TargetDependency.feature(name: "SigninFeature")
    static let IntroFeature = TargetDependency.feature(name: "IntroFeature")
    static let BaseFeature = TargetDependency.feature(name: "BaseFeature")
    static let RootFeature = TargetDependency.feature(name: "RootFeature")
}

public extension TargetDependency.Project.Module {
    static let ThirdPartyLib = TargetDependency.module(name: "ThirdPartyLib")
    static let FeatureThirdPartyLib = TargetDependency.module(name: "FeatureThirdPartyLib")
    static let Utility = TargetDependency.module(name: "Utility")
    static let NFCModule = TargetDependency.module(name: "NFCModule")
    static let KeychainModule = TargetDependency.module(name: "KeychainModule")
    static let ErrorModule = TargetDependency.module(name: "ErrorModule")
}

public extension TargetDependency.Project.Service {
    static let APIKit = TargetDependency.service(name: "APIKit")
    static let Data = TargetDependency.service(name: "DataModule")
    static let Domain = TargetDependency.service(name: "DomainModule")
    static let DatabaseModule = TargetDependency.service(name: "DatabaseModule")
    static let NetworkModule = TargetDependency.service(name: "NetworkModule")
    static let DataMappingModule = TargetDependency.service(name: "DataMappingModule")
}

public extension TargetDependency.Project.UserInterfaces {
    static let DesignSystem = TargetDependency.ui(name: "DesignSystem")
    static let LocalizableManager = TargetDependency.ui(name: "LocalizableManager")
}

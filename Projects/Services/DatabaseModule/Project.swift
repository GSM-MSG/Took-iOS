import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "DatabaseModule",
    product: .staticFramework,
    dependencies: [
        .Project.Module.Utility,
        .Project.Module.KeychainModule,
        .Project.Service.Domain
    ]
)

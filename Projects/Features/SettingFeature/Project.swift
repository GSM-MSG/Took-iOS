import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "SettingFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature
    ]
)

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MainFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature,
        .Project.Features.CardFeature,
        .Project.Features.CardListFeature,
        .Project.Features.SettingFeature,
        .Project.Features.NewCardFeature
    ]
)

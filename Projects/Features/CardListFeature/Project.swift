import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "CardListFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature
    ]
)

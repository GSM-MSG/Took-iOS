import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "CardFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.BaseFeature,
        .Project.Module.NFCModule
    ]
)

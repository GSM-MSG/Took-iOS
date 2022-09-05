import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "CardFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature,
        .Project.Module.NFCModule
    ]
)
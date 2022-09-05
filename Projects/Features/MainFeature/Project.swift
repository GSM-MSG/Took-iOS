import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "MainFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature
    ]
)
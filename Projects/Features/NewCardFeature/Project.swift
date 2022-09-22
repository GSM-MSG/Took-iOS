import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "NewCardFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature
    ]
)

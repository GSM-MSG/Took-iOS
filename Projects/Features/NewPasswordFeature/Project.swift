import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "NewPasswordFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature
    ]
)

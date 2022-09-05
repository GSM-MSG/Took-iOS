import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "VerifyFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature
    ]
)
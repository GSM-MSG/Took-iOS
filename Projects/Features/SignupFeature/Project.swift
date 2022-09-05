import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "SignupFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature,
        .Project.Features.VerifyFeature
    ]
)

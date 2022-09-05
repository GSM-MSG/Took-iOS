import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "IntroFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature
    ]
)
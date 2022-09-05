import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "RootFeature",
    product: .staticFramework,
    dependencies: [
        .Project.Features.CommonFeature,
        .Project.Features.IntroFeature,
        .Project.Features.MainFeature,
    ]
)

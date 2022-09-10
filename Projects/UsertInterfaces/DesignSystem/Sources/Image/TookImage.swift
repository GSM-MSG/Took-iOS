import SwiftUI

extension DesignSystemImages {
    var suiImage: SwiftUI.Image {
        SwiftUI.Image(uiImage: image)
    }
}

public struct TookImage: View {
    public enum Image {
        case background
    }

    var image: Image
    var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        imageToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    private func imageToImage() -> SwiftUI.Image {
        switch image {
        case .background:
            return DesignSystemAsset.Images.background.suiImage
        }
    }
}

struct TookImage_Previews: PreviewProvider {
    static var previews: some View {
        TookImage(.background)
            .ignoresSafeArea()
    }
}

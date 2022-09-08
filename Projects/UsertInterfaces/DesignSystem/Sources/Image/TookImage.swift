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

    public var image: Image

    public init(
        _ image: Image
    ) {
        self.image = image
    }

    public var body: some View {
        imageToImage()
    }

    private func imageToImage() -> some View {
        switch image {
        case .background:
            return DesignSystemAsset.Images.background.suiImage
                .resizable()
                .renderingMode(.original)
        }
    }
}

struct TookImage_Previews: PreviewProvider {
    static var previews: some View {
        TookImage(.background)
            .ignoresSafeArea()
    }
}

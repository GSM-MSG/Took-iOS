import SwiftUI

public struct TookIcon: View {
    public enum Icon {
        case gear
        case vertical
        case horizontal
        case plusCircleFill
        case card

        case tabHome
        case tabCardLIst
    }

    var icon: Icon
    var color: Color
    var width: CGFloat
    var height: CGFloat
    var renderingMode: Image.TemplateRenderingMode

    public init(
        _ icon: Icon,
        color: Color = .Took.white,
        width: CGFloat = 20,
        height: CGFloat = 20,
        renderingMode: Image.TemplateRenderingMode = .template
    ) {
        self.icon = icon
        self.color = color
        self.width = width
        self.height = height
        self.renderingMode = renderingMode
    }

    public var body: some View {
        iconToImage(icon)
            .resizable()
            .renderingMode(renderingMode)
            .foregroundColor(color)
            .frame(width: width, height: height)
    }

    private func iconToImage(_ icon: Icon) -> Image {
        switch icon {
        case .gear:
            return DesignSystemAsset.Icons.gear.suiImage
        case .vertical:
            return DesignSystemAsset.Icons.vertical.suiImage
        case .horizontal:
            return DesignSystemAsset.Icons.horizontal.suiImage
        case .plusCircleFill:
            return Image(systemName: "plus.circle.fill")
        case .card:
            return DesignSystemAsset.Icons.card.suiImage
        case .tabHome:
            return DesignSystemAsset.Icons.tabHome.suiImage
        case .tabCardLIst:
            return DesignSystemAsset.Icons.tabCardList.suiImage
        }
    }
}

struct TookIcon_Previews: PreviewProvider {
    static var previews: some View {
        TookIcon(.plusCircleFill)
    }
}

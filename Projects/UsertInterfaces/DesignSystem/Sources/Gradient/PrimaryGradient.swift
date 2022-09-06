import SwiftUI

public extension RadialGradient {
    static let primary = RadialGradient(
        gradient: Gradient(stops: [
            .init(
                color: Color(red: 0.3333, green: 0.2274, blue: 0.9098),
                location: 0.0013448053505271673
            ),
            .init(
                color: Color(red: 0.8941, green: 0.4313, blue: 0.898),
                location: 1
            )
        ]),
        center: .init(x: -0.5058307434425922, y: 0.4999999916185889),
        startRadius: 9.655802736371795,
        endRadius: 743.6020164377771
    )
}

public struct PrimaryGradientPreview: PreviewProvider {
    public static var previews: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(RadialGradient.primary)
            .frame(width: 343, height: 56)

            RoundedRectangle(cornerRadius: 40)
                .fill(RadialGradient.primary)
            .frame(width: 100, height: 100)
        }
    }
}

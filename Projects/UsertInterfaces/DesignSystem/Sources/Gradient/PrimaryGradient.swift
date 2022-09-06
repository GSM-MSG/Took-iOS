import SwiftUI

public extension RadialGradient {
    static let primary = RadialGradient(
        gradient: Gradient(stops: [
            .init(
                color: Color(red: 0.4078, green: 0.2549, blue: 0.9098),
                location: 0
            ),
            .init(
                color: Color(red: 0.5529, green: 0.3098, blue: 0.9058),
                location: 1
            )
        ]),
        center: UnitPoint(x: -7.450580927215178e-8, y: 0.49999996274709524),
        startRadius: 3.260282052530631,
        endRadius: 223.60680774598225
    )
}

public struct PrimaryGradientPreview: PreviewProvider {
    public static var previews: some View {
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(RadialGradient.primary)
                .frame(height: 56)
                .padding(.horizontal)
        }
    }
}

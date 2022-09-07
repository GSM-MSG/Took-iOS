import SwiftUI

struct TookCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            ZStack {
                if configuration.isOn {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(RadialGradient.primary)
                        .frame(width: 24, height: 24)
                } else {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.Took.gray)
                        .frame(width: 24, height: 24)
                }
                Image(systemName: "checkmark")
                    .resizable()
                    .frame(width: 8, height: 8)
                    .foregroundColor(configuration.isOn ? Color.Took.white : .Took.lightGray)
            }
        }
    }
}

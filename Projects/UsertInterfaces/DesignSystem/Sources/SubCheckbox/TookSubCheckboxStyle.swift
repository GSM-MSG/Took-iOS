import SwiftUI

struct TookSubCheckboxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Image(systemName: "checkmark")
                .resizable()
                .foregroundColor(.Took.gray)
                .if(configuration.isOn) {
                    $0.maskContent(using: RadialGradient.primary)
                }
                .frame(width: 13, height: 12)
        }
    }
}

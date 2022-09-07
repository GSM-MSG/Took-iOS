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

private extension View {
    func `if`<T: View>(_ conditional: Bool, transform: (Self) -> T) -> some View {
        Group {
            if conditional { transform(self) } else { self }
        }
    }
    func `if`<T: View>(
        _ condition: Bool,
        true trueTransform: (Self) -> T,
        false falseTransform: (Self) -> T
    ) -> some View {
        Group {
            if condition { trueTransform(self) } else { falseTransform(self) }
        }
    }
}

import SwiftUI

public struct TookSubCheckbox: View {
    @Binding var isOn: Bool

    public init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(TookSubCheckboxStyle())
            .animation(.easeInOut, value: isOn)
            .onTapGesture {
                withAnimation {
                    isOn.toggle()
                }
            }
    }
}

public struct TookSubCheckbox_Previews: PreviewProvider {
    public static var previews: some View {
        HStack {
            TookSubCheckbox(isOn: .constant(true))
            TookSubCheckbox(isOn: .constant(false))
        }
    }
}

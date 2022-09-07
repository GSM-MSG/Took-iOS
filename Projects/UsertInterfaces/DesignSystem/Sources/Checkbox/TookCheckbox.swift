import SwiftUI

public struct TookCheckbox: View {
    @Binding var isOn: Bool

    public init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(TookCheckboxStyle())
            .animation(.easeInOut, value: isOn)
            .onTapGesture {
                withAnimation {
                    isOn.toggle()
                }
            }
    }
}

public struct TookCheckbox_Previews: PreviewProvider {
    public static var previews: some View {
        VStack {
            TookCheckbox(isOn: .constant(true))
            TookCheckbox(isOn: .constant(false))
        }
    }
}

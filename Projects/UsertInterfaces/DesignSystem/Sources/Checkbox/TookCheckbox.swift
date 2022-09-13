import SwiftUI

public struct TookCheckbox: View {
    @Binding var isOn: Bool
    let willChange: (Bool) -> Void
    let didChange: (Bool) -> Void

    public init(
        isOn: Binding<Bool>,
        willChange: @escaping (Bool) -> Void = { _ in },
        didChange: @escaping (Bool) -> Void = { _ in }
    ) {
        self._isOn = isOn
        self.willChange = willChange
        self.didChange = didChange
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(TookCheckboxStyle())
            .animation(.easeInOut, value: isOn)
            .onTapGesture {
                willChange(isOn)
                withAnimation {
                    isOn.toggle()
                }
                didChange(isOn)
            }
    }
}

public struct TookCheckbox_Previews: PreviewProvider {
    public static var previews: some View {
        HStack {
            TookCheckbox(isOn: .constant(true))
            TookCheckbox(isOn: .constant(false))
        }
    }
}

import SwiftUI

public struct TookSubCheckbox: View {
    @Binding var isOn: Bool
    let willChange: (Bool) -> Void
    let didChange: (Bool) -> Void

    public init(
        isOn: Binding<Bool>,
        willChange: @escaping (Bool) -> Void = { _ in },
        didChange: @escaping (Bool) -> Void = { _ in }
    ) {
        _isOn = isOn
        self.willChange = willChange
        self.didChange = didChange
    }

    public var body: some View {
        Toggle("", isOn: $isOn)
            .toggleStyle(TookSubCheckboxStyle())
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

public struct TookSubCheckbox_Previews: PreviewProvider {
    public static var previews: some View {
        HStack {
            TookSubCheckbox(isOn: .constant(true))
            TookSubCheckbox(isOn: .constant(false))
        }
    }
}

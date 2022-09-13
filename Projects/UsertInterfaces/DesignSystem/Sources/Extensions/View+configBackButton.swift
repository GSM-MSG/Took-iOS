import SwiftUI

public extension View {
    func configBackButton(willDismiss: @escaping () -> Void = {}, dismiss: DismissAction) -> some View {
        self
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        willDismiss()
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 9, height: 16)
                            .foregroundColor(.Took.white)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}

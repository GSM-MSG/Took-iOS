import SwiftUI

public extension View {
    func configBackButton(dismiss: DismissAction) -> some View {
        self
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
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

import SwiftUI

public extension View {
    func navigate<NewView: View>(
        to view: NewView,
        when binding: Binding<Bool>,
        isDetailLink: Bool = false
    ) -> some View {
        self.background(
            NavigationLink(isActive: binding, destination: {
                view
            }, label: {
                EmptyView()
            })
            .isDetailLink(isDetailLink)
        )
    }
}

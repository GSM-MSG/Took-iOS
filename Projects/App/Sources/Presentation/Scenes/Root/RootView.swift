import SwiftUI

struct RootView: View {
    private let viewModel = RootViewModel()
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}

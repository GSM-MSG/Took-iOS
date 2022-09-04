import SwiftUI

public struct RootView: View {
    @StateObject var viewModel: RootViewModel

    public init(viewModel: RootViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    public var body: some View {
        Text("Hello, World!")
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(viewModel: .init())
    }
}

import SwiftUI

public extension View {
    func maskContent<T: View>(using: T) -> some View {
        using.mask(self)
    }
}

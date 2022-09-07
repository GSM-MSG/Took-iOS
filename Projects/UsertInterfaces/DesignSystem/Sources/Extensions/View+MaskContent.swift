import SwiftUI

public extension View {
    func maskContent<T: View>(using: T) -> some View {
        using.mask(self)
    }
}

public extension View {
    func `if`<T: View>(
        _ conditional: Bool,
        transform: (Self) -> T
    ) -> some View {
        Group {
            if conditional { transform(self) } else { self }
        }
    }

    func `if`<T: View>(
        _ condition: Bool,
        true trueTransform: (Self) -> T,
        false falseTransform: (Self) -> T
    ) -> some View {
        Group {
            if condition { trueTransform(self) } else { falseTransform(self) }
        }
    }
}

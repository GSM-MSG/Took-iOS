import SwiftUI

// swiftlint: disable identifier_name
@available(iOS 15.0, *)
struct AdaptiveSheet<T: View>: ViewModifier {
    let sheetContent: T
    @Binding var isPresented: Bool
    let detents: [UISheetPresentationController.Detent]
    let smallestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier?
    let prefersScrollingExpandsWhenScrolledToEdge: Bool
    let prefersEdgeAttachedInCompactHeight: Bool
    let willDismiss: () -> Void
    let didDismiss: () -> Void

    init(
        isPresented: Binding<Bool>,
        detents: [UISheetPresentationController.Detent] = [.medium(), .large()],
        smallestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier? = .medium,
        prefersScrollingExpandsWhenScrolledToEdge: Bool = false,
        prefersEdgeAttachedInCompactHeight: Bool = true,
        willDismiss: @escaping () -> Void,
        didDismiss: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> T
    ) {
        self.sheetContent = content()
        self.detents = detents
        self.smallestUndimmedDetentIdentifier = smallestUndimmedDetentIdentifier
        self.prefersEdgeAttachedInCompactHeight = prefersEdgeAttachedInCompactHeight
        self.prefersScrollingExpandsWhenScrolledToEdge = prefersScrollingExpandsWhenScrolledToEdge
        self.willDismiss = willDismiss
        self.didDismiss = didDismiss
        self._isPresented = isPresented
    }

    func body(content: Content) -> some View {
        ZStack {
            content
            if isPresented {
                Color.Took.black.opacity(0.4)
                    .onTapGesture {
                        isPresented = false
                    }
                    .ignoresSafeArea()                
            }
            CustomSheetUI(
                isPresented: $isPresented,
                detents: detents,
                smallestUndimmedDetentIdentifier: smallestUndimmedDetentIdentifier,
                prefersScrollingExpandsWhenScrolledToEdge: prefersScrollingExpandsWhenScrolledToEdge,
                prefersEdgeAttachedInCompactHeight: prefersEdgeAttachedInCompactHeight,
                willDismiss: willDismiss,
                didDismiss: didDismiss,
                content: {sheetContent}
            )
            .frame(width: 0, height: 0)
        }
    }
}
@available(iOS 15.0, *)
public extension View {
    func adaptiveSheet<T: View>(
        isPresented: Binding<Bool>,
        detents: [UISheetPresentationController.Detent] = [.medium(), .large()],
        smallestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier? = .medium,
        prefersScrollingExpandsWhenScrolledToEdge: Bool = false,
        prefersEdgeAttachedInCompactHeight: Bool = true,
        willDismiss: @escaping () -> Void = {},
        didDismiss: @escaping () -> Void = {},
        @ViewBuilder content: @escaping () -> T
    )-> some View {
        modifier(
            AdaptiveSheet(
                isPresented: isPresented,
                detents: detents,
                smallestUndimmedDetentIdentifier: smallestUndimmedDetentIdentifier,
                prefersScrollingExpandsWhenScrolledToEdge: prefersScrollingExpandsWhenScrolledToEdge,
                prefersEdgeAttachedInCompactHeight: prefersEdgeAttachedInCompactHeight,
                willDismiss: willDismiss,
                didDismiss: didDismiss,
                content: content
            )
        )
    }
}

@available(iOS 15.0, *)
struct CustomSheetUI<Content: View>: UIViewControllerRepresentable {
    let content: Content
    @Binding var isPresented: Bool
    let detents: [UISheetPresentationController.Detent]
    let smallestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier?
    let prefersScrollingExpandsWhenScrolledToEdge: Bool
    let prefersEdgeAttachedInCompactHeight: Bool
    let willDismiss: () -> Void
    let didDismiss: () -> Void

    init(
        isPresented: Binding<Bool>,
        detents: [UISheetPresentationController.Detent] = [.medium(), .large()],
        smallestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier? = .medium,
        prefersScrollingExpandsWhenScrolledToEdge: Bool = false,
        prefersEdgeAttachedInCompactHeight: Bool = true,
        willDismiss: @escaping () -> Void,
        didDismiss: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
        self.detents = detents
        self.smallestUndimmedDetentIdentifier = smallestUndimmedDetentIdentifier
        self.prefersEdgeAttachedInCompactHeight = prefersEdgeAttachedInCompactHeight
        self.prefersScrollingExpandsWhenScrolledToEdge = prefersScrollingExpandsWhenScrolledToEdge
        self.willDismiss = willDismiss
        self.didDismiss = didDismiss
        self._isPresented = isPresented
    }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    func makeUIViewController(context: Context) -> CustomSheetViewController<Content> {
        let vc = CustomSheetViewController(
            coordinator: context.coordinator,
            detents: detents,
            smallestUndimmedDetentIdentifier: smallestUndimmedDetentIdentifier,
            prefersScrollingExpandsWhenScrolledToEdge: prefersScrollingExpandsWhenScrolledToEdge,
            prefersEdgeAttachedInCompactHeight: prefersEdgeAttachedInCompactHeight,
            willDismiss: willDismiss,
            didDismiss: didDismiss,
            content: {content}
        )
        return vc
    }

    func updateUIViewController(_ uiViewController: CustomSheetViewController<Content>, context: Context) {
        if isPresented {
            uiViewController.presentModalView()
        } else {
            uiViewController.dismissModalView()
        }
    }
    class Coordinator: NSObject, UIAdaptivePresentationControllerDelegate {
        var parent: CustomSheetUI
        init(_ parent: CustomSheetUI) {
            self.parent = parent
        }
        // Adjust the variable when the user dismisses with a swipe
        func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
            if parent.isPresented {
                parent.isPresented = false
            }
        }
    }
}

@available(iOS 15.0, *)
class CustomSheetViewController<Content: View>: UIViewController {
    let content: Content
    let coordinator: CustomSheetUI<Content>.Coordinator
    let detents: [UISheetPresentationController.Detent]
    let smallestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier?
    let prefersScrollingExpandsWhenScrolledToEdge: Bool
    let prefersEdgeAttachedInCompactHeight: Bool
    let willDismiss: () -> Void
    let didDismiss: () -> Void
    private var isLandscape: Bool = UIDevice.current.orientation.isLandscape

    init(
        coordinator: CustomSheetUI<Content>.Coordinator,
        detents: [UISheetPresentationController.Detent] = [.medium(), .large()],
        smallestUndimmedDetentIdentifier: UISheetPresentationController.Detent.Identifier? = .medium,
        prefersScrollingExpandsWhenScrolledToEdge: Bool = false,
        prefersEdgeAttachedInCompactHeight: Bool = true,
        willDismiss: @escaping () -> Void,
        didDismiss: @escaping () -> Void,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content()
        self.coordinator = coordinator
        self.detents = detents
        self.smallestUndimmedDetentIdentifier = smallestUndimmedDetentIdentifier
        self.prefersEdgeAttachedInCompactHeight = prefersEdgeAttachedInCompactHeight
        self.prefersScrollingExpandsWhenScrolledToEdge = prefersScrollingExpandsWhenScrolledToEdge
        self.willDismiss = willDismiss
        self.didDismiss = didDismiss
        super.init(nibName: nil, bundle: .main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func dismissModalView() {
        willDismiss()
        dismiss(animated: true, completion: nil)
        didDismiss()
    }

    func presentModalView() {
        let hostingController = UIHostingController(rootView: content)

        hostingController.modalPresentationStyle = .popover
        hostingController.presentationController?.delegate = coordinator as UIAdaptivePresentationControllerDelegate
        hostingController.modalTransitionStyle = .coverVertical
        if let hostPopover = hostingController.popoverPresentationController {
            hostPopover.sourceView = super.view
            let sheet = hostPopover.adaptiveSheetPresentationController
            sheet.detents = (isLandscape ? [.large()] : detents)
            sheet.largestUndimmedDetentIdentifier = smallestUndimmedDetentIdentifier
            sheet.prefersScrollingExpandsWhenScrolledToEdge = prefersScrollingExpandsWhenScrolledToEdge
            sheet.prefersEdgeAttachedInCompactHeight = prefersEdgeAttachedInCompactHeight
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true

        }
        if presentedViewController == nil {
            present(hostingController, animated: true, completion: nil)
        }
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        if UIDevice.current.orientation.isLandscape {
            isLandscape = true
            self.presentedViewController?.popoverPresentationController?
                .adaptiveSheetPresentationController.detents = [.large()]
        } else {
            isLandscape = false
            self.presentedViewController?.popoverPresentationController?
                .adaptiveSheetPresentationController.detents = detents
        }
    }
}

import SwiftUI
import DesignSystem

public struct NewCardView: View {

    @StateObject var viewModel: NewCardViewModel

    public init(viewModel: NewCardViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    @State var showAction: Bool = false
    @State var showImagePicker0: Bool = false
    @State var showImagePicker1: Bool = false

    @State var uiImage: UIImage?
    @State var backImage: UIImage?

    public var body: some View {

        GeometryReader { geometry in
            ZStack {
                TookImage(.background)
                    .ignoresSafeArea()

                VStack(spacing: 16) {
                    cardView(
                        geometry: geometry,
                        title: "앞면 등록하기",
                        image: $viewModel.frontImage,
                        isShow: $showImagePicker0
                    )

                    cardView(
                        geometry: geometry,
                        title: "뒷면 등록하기",
                        image: $viewModel.backImage,
                        isShow: $showImagePicker1
                    )

                    Spacer()

                    TookButton(text: "등록완료!")
                        .padding(16)
                        .disabled(viewModel.isFormEmpty)
                }
            }
            .navigationTitle("명함 등록")
            .navigationBarTitleDisplayMode(.inline)
        }

    }

    @ViewBuilder
    func cardView(
        geometry: GeometryProxy,
        title: String,
        image: Binding<UIImage?>,
        isShow: Binding<Bool>
    ) -> some View {
        Group {
            if let image = image.wrappedValue {
                Image(uiImage: image)
                    .resizable()
                    .cornerRadius(8)
            } else {
                VStack(spacing: 8) {
                    Image(systemName: "plus.circle.fill")

                    Text(title)
                        .tookTypo(.medium(.medium))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: (geometry.size.width - 32) * 0.6)
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.Took.darkGray)
        }
        .background(Color.Took.transparencyBoxBg)
        .padding(.horizontal, 16)
        .onTapGesture {
            isShow.wrappedValue.toggle()
        }
        .imagePicker(isShow: isShow, uiImage: image)
    }
}

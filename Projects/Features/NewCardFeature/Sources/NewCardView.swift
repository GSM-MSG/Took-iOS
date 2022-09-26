import SwiftUI
import DesignSystem

public struct NewCardView: View {

    public init() {}

    public var body: some View {
        GeometryReader { geometry in
            ZStack {
                TookImage(.background)
                    .ignoresSafeArea()
                    .tag(0)
                VStack {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .padding(.bottom, 8)
                            .frame(width: 32, height: 32)

                        Text("앞면 등록하기")
                            .tookTypo(.medium(.medium))
                    }
                    .frame(width: geometry.size.width - 24, height: geometry.size.width * 0.6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.Took.darkGray)
                    )
                    .background(Color.Took.transparencyBoxBg)
                    .padding()
                    VStack {
                        Image(systemName: "plus.circle.fill")
                            .padding(.bottom, 8)
                        Text("뒷면 등록하기")
                            .tookTypo(.medium(.medium))
                    }
                    .frame(width: (geometry.size.width) - 24, height: geometry.size.width * 0.6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.Took.darkGray)
                    )
                    .background(Color.Took.transparencyBoxBg)
                    .padding(.bottom, 18)
                    Spacer()
                    TookButton(text: "등록완료!")
                        .padding()
                }
            }
            .navigationTitle("명함 등록")
            .navigationBarTitleDisplayMode(.inline)
        }

    }
}

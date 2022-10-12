import SwiftUI
import DesignSystem

struct TermsView: View {
    @State var allAgreeState = false
    @State var agreedTerms: [Terms] = []
    @State var privacyTerms = false
    let allAgreeAction: () -> Void

    var body: some View {
        VStack(alignment: .leading) {
            Text("약관동의")
                .tookTypo(.semibold(.extraLarge), color: .Took.black)
                .padding(.top, 28)
                .padding(.horizontal, 16)

            HStack(spacing: 8) {
                TookCheckbox(isOn: $allAgreeState, willChange: { isOn in
                    agreedTerms = isOn ? [] : Terms.allCases
                    privacyTerms = !isOn
                })

                Text("약관 전체동의")
                    .tookTypo(.medium(.large), color: .Took.black)

                Spacer()
            }
            .onTapGesture {
                agreedTerms = allAgreeState ? [] : Terms.allCases
                privacyTerms = !allAgreeState
                allAgreeState = !allAgreeState
            }
            .padding(.top, 24)

            Divider()
                .padding(.vertical, 16)

            VStack(alignment: .leading) {
                Group {
                    termsRow(term: .privacy, isOn: $privacyTerms)
                }
            }

            Spacer()

            TookButton(text: "확인", action: allAgreeAction)
                .disabled(!allAgreeState)
                .padding(.bottom, 16)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, 16)
        .background(Color.Took.white)
    }

    @ViewBuilder
    func termsRow(term: Terms, isOn: Binding<Bool>) -> some View {
        HStack {
            TookSubCheckbox(isOn: isOn, willChange: { isChecked in
                if isChecked {
                    agreedTerms.removeAll { $0 == term }
                } else {
                    agreedTerms.append(term)
                }
                withAnimation {
                    allAgreeState = agreedTerms == Terms.allCases
                }
            })

            Text(term.display)
                .tookTypo(.regular(.medium), color: .Took.gray)

            Spacer()

            Link(destination: term.detailLink) {
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 9, height: 16)
                    .foregroundColor(.Took.lightGray)
            }
        }
        .onTapGesture {
            if isOn.wrappedValue {
                agreedTerms.removeAll { $0 == term }
            } else {
                agreedTerms.append(term)
            }
            withAnimation {
                allAgreeState = agreedTerms == Terms.allCases
            }
            isOn.wrappedValue.toggle()
        }
    }
}

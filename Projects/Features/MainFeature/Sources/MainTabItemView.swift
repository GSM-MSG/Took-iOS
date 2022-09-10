import SwiftUI
import DesignSystem

struct MainTabItemView: View {
    var icon: TookIcon.Icon
    var text: String
    var isSelected: Bool

    init(
        _ icon: TookIcon.Icon,
        text: String,
        isSelected: Bool
    ) {
        self.icon = icon
        self.text = text
        self.isSelected = isSelected
    }

    var body: some View {
        VStack {
            TookIcon(
                icon,
                color: isSelected ? .Took.white : .Took.darkGray,
                width: 28,
                height: 28
            )

            Text(text)
                .tookTypo(.medium(.small))
                .foregroundColor(isSelected ? .Took.white : .Took.darkGray)
        }
    }
}

struct MainTabItemView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabItemView(.tabHome, text: "", isSelected: false)
    }
}

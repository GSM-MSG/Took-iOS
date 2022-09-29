import SwiftUI
import CommonFeature
import Combine

public class NewCardViewModel: BaseViewModel {
    @Published var frontImage: UIImage?
    @Published var backImage: UIImage?

    var isFormEmpty: Bool {
        frontImage == nil || backImage == nil
    }

    func imageUpload() async {
    }
}

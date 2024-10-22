import Foundation
import UIKit

enum FontName: String {
    case regular = "PoppinsLatin-Regular"
    case bold = "PoppinsLatin-Bold"
    case medium = "PoppinsLatin-Medium"
}

extension UIFont {
    convenience init(named: FontName, size: CGFloat) {
        self.init(name: named.rawValue, size: size)!
    }
}

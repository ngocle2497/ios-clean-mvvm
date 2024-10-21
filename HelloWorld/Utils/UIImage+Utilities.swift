import Foundation
import UIKit

extension UIImage {
    func normalizedImage() -> UIImage {
        guard imageOrientation != .up else {
            return self
        }
        return UIGraphicsImageRenderer(size: size, format: .preferred())
            .image {
                draw(in: $0.format.bounds)
            }
    }
}

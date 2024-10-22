import Foundation
import UIKit

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var uiNib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static var uiNib: UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
}

extension UITableView {
    func register<T: UITableViewCell>(cell: T.Type) {
        self.register(cell.uiNib, forCellReuseIdentifier: cell.identifier)
    }
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(cell: T.Type) {
        self.register(cell.uiNib, forCellWithReuseIdentifier: cell.identifier)
    }
}

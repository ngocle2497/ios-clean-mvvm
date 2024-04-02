import Foundation
import UIKit


protocol ColorProtocol {
    var primary: UIColor { get }
    var primaryFocus: UIColor { get }
    var primaryContent: UIColor { get }
    
    var secondary: UIColor { get }
    var secondaryFocus: UIColor { get }
    var secondaryContent: UIColor { get }
}

protocol FontProtocol {
    var heading1: UIFont { get }
    var heading2: UIFont { get }
    var heading3: UIFont { get }
    var heading4: UIFont { get }
    
    var title1Regular: UIFont { get }
    var title1Bold: UIFont { get }
    var title2Regular: UIFont { get }
    var title2Bold: UIFont { get }
}



struct ThemeManager {
    fileprivate static var colorShared: ColorProtocol = DarkColorTheme()
    fileprivate static var fontShared: FontProtocol = DefaultFont()
    static func updateTheme(_ colorTheme: ColorTheme) {
        switch colorTheme {
        case .dark:
            ThemeManager.colorShared = DarkColorTheme()
        case .light:
            ThemeManager.colorShared = LightColorTheme()
        }
    }
    
    static func updateFont(_ fontSize: FontSize) {
        switch fontSize {
        case .default:
            ThemeManager.fontShared = DefaultFont()
        case .large:
            ThemeManager.fontShared = DefaultFont()
        }
    }
}

extension UIFont {
    static var heading1: UIFont {
        get {
            ThemeManager.fontShared.heading1
        }
    }
    static var heading2: UIFont {
        get {
            ThemeManager.fontShared.heading2
        }
    }
    
    static var heading3: UIFont {
        get {
            ThemeManager.fontShared.heading3
        }
    }
    
    static var heading4: UIFont {
        get {
            ThemeManager.fontShared.heading4
        }
    }
    
    static var title1Regular: UIFont {
        get {
            ThemeManager.fontShared.title1Regular
        }
    }
    
    static var title1Bold: UIFont {
        get {
            ThemeManager.fontShared.title1Bold
        }
    }
    
    static var title2Regular: UIFont {
        get {
            ThemeManager.fontShared.title2Regular
        }
    }
    
    static  var title2Bold: UIFont {
        get {
            ThemeManager.fontShared.title2Bold
        }
    }
}

extension UIColor {
    static var primary: UIColor {
        get {
            return ThemeManager.colorShared.primary
        }
    }
    
    static var primaryFocus: UIColor {
        get {
            ThemeManager.colorShared.primaryFocus
        }
    }
    
    static var primaryContent: UIColor {
        get {
            ThemeManager.colorShared.primaryContent
        }
    }
    
    static var secondary: UIColor {
        get {
            ThemeManager.colorShared.secondary
        }
    }
    
    static var secondaryFocus: UIColor {
        get {
            ThemeManager.colorShared.secondaryFocus
        }
    }
    
    static var secondaryContent: UIColor {
        get {
            ThemeManager.colorShared.secondaryContent
        }
    }
}

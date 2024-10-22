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

let COLORS_THEME = ThemeManager.colorShared
let FONTS_THEME = ThemeManager.fontShared

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
            FONTS_THEME.heading1
        }
    }
    static var heading2: UIFont {
        get {
            FONTS_THEME.heading2
        }
    }
    
    static var heading3: UIFont {
        get {
            FONTS_THEME.heading3
        }
    }
    
    static var heading4: UIFont {
        get {
            FONTS_THEME.heading4
        }
    }
    
    static var title1Regular: UIFont {
        get {
            FONTS_THEME.title1Regular
        }
    }
    
    static var title1Bold: UIFont {
        get {
            FONTS_THEME.title1Bold
        }
    }
    
    static var title2Regular: UIFont {
        get {
            FONTS_THEME.title2Regular
        }
    }
    
    static  var title2Bold: UIFont {
        get {
            FONTS_THEME.title2Bold
        }
    }
}

extension UIColor {
    static var primary: UIColor {
        get {
            return COLORS_THEME.primary
        }
    }
    
    static var primaryFocus: UIColor {
        get {
            COLORS_THEME.primaryFocus
        }
    }
    
    static var primaryContent: UIColor {
        get {
            COLORS_THEME.primaryContent
        }
    }
    
    static var secondary: UIColor {
        get {
            COLORS_THEME.secondary
        }
    }
    
    static var secondaryFocus: UIColor {
        get {
            COLORS_THEME.secondaryFocus
        }
    }
    
    static var secondaryContent: UIColor {
        get {
            COLORS_THEME.secondaryContent
        }
    }
}

import Foundation
import RxSwift
import RxCocoa

enum Language: String {
    case english = "en"
    case vietnam = "vi"
}

enum ColorTheme: String {
    case dark = "dark"
    case light = "light"
}

enum FontSize: String {
    case `default` = "Default"
    case large = "Large"
}


final class GlobalSettings {
    static let shared: GlobalSettings = GlobalSettings()
    
    private var disposeBag = DisposeBag()
    
    let language = BehaviorRelay<Language>(value:  LocalStorage.shared.appLanguage!)
    let theme = BehaviorRelay<ColorTheme>(value: LocalStorage.shared.appTheme!)
    let fontSize = BehaviorRelay<FontSize>(value:  LocalStorage.shared.appFont!)
    
    init() {
        ThemeManager.updateFont(fontSize.value)
        ThemeManager.updateTheme(theme.value)
        
        language.subscribe(with: self) { gs, nextValue in
            LocalStorage.shared.appLanguage = nextValue
        }.disposed(by: disposeBag)
        
        theme.subscribe(with: self) { gs, nextValue in
            LocalStorage.shared.appTheme = nextValue
        }.disposed(by: disposeBag)
        
        fontSize.subscribe(with: self) { gs, nextValue in
            LocalStorage.shared.appFont = nextValue
        }.disposed(by: disposeBag)
    }
    
    func updateLanguage(lang: Language) {
        language.accept(lang)
    }
    
    func updateLanguage(_ with: (_ oldValue: Language) -> Language) {
        language.accept(with(language.value))
    }
    
    func updateTheme(theme: ColorTheme) {
        self.theme.accept(theme)
    }
    
    func updateTheme(_ with: (_ oldValue: ColorTheme) -> ColorTheme) {
        theme.accept(with(theme.value))
    }
    
    func updateFontSize(font: FontSize) {
        fontSize.accept(font)
    }
    
    func updateFontSize(_ with: (_ oldValue: FontSize) -> FontSize) {
        fontSize.accept(with(fontSize.value))
    }
}

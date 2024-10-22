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

let GLOBAL_SETTING = GlobalSettings.shared

struct GlobalSettings {
    static let shared: GlobalSettings = GlobalSettings()
    
    private var disposeBag = DisposeBag()
    
    let language                    = BehaviorRelay<Language>(value: LOCAL_STORAGE.appLanguage!)
    let theme                       = BehaviorRelay<ColorTheme>(value: LOCAL_STORAGE.appTheme!)
    let fontSize                    = BehaviorRelay<FontSize>(value: LOCAL_STORAGE.appFont!)
    
    init() {
        ThemeManager.updateFont(fontSize.value)
        ThemeManager.updateTheme(theme.value)
        
        language.skip(1).subscribe(onNext:  { nextValue in
            LOCAL_STORAGE.appLanguage     = nextValue
        })
        .disposed(by: disposeBag)
        
        theme.skip(1).subscribe(onNext:     { nextValue in
            LOCAL_STORAGE.appTheme        = nextValue
        })
        .disposed(by: disposeBag)
        
        fontSize.skip(1).subscribe(onNext:  { nextValue in
            LOCAL_STORAGE.appFont         = nextValue
        })
        .disposed(by: disposeBag)
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

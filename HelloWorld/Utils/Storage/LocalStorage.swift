import Foundation
import MMKV

var LOCAL_STORAGE = LocalStorage.shared

struct LocalStorage {
    static var shared = LocalStorage()
    private var instance: MMKV?
    
    var onboardingShown: Bool {
        get {
            return instance?.bool(forKey: "onboardingShown") ?? false
        }
        set {
            instance?.set(newValue, forKey: "onboardingShown")
        }
    }
    
    var appToken: String? {
        get {
            return instance?.string(forKey: "appToken")
        }
        set {
            if let value = newValue {
                instance?.set(value, forKey: "appToken")
            } else {
                instance?.removeValue(forKey: "appToken")
            }
            
        }
    }
    
    var appTheme: ColorTheme? {
        get {
            guard let raw =  instance?.string(forKey: "appTheme") else {
                return .dark
            }
            guard let value = ColorTheme(rawValue: raw) else {
                return .dark
            }
            return value
        }
        set {
            if let value = newValue {
                instance?.set(value.rawValue, forKey: "appTheme")
            } else {
                instance?.removeValue(forKey: "appTheme")
            }
        }
    }
    
    var appFont: FontSize? {
        get {
            guard let raw =  instance?.string(forKey: "appFont") else {
                return .default
            }
            guard let value = FontSize(rawValue: raw) else {
                return .default
            }
            return value
        }
        set {
            if let value = newValue {
                instance?.set(value.rawValue, forKey: "appFont")
            } else {
                instance?.removeValue(forKey: "appFont")
            }
        }
    }
    
    var appLanguage: Language? {
        get {
            guard let raw =  instance?.string(forKey: "appLanguage") else {
                return .english
            }
            guard let value = Language(rawValue: raw) else {
                return .english
            }
            return value
        }
        set {
            if let value = newValue {
                instance?.set(value.rawValue, forKey: "appLanguage")
            } else {
                instance?.removeValue(forKey: "appLanguage")
            }
        }
    }
    
    func resetAll() {
        if let instance = instance {
            for key in instance.allKeys() {
                instance.removeValue(forKey: key as! String)
            }
        }
        
    }
    
    private init() {
        MMKV.initialize(rootDir: nil)
        self.instance = MMKV(mmapID: "LocalStorage", cryptKey: "ABCB".data(using: .utf8), mode: .singleProcess)
    }
    
    
}

//
//  SFLocalizationStorager.swift
//  Test
//
//  Created by Stroman on 2021/9/18.
//

import Foundation

class SFLocalizationStorger: NSObject {
    // MARK: - lifecycle
    deinit {
        print("\(type(of: self))释放了")
    }
    
    override init() {
        super.init()
        self.customInitilizer()
    }
    // MARK: - custom methods
    private func customInitilizer() -> Void {
    }
    // MARK: - public interfaces
    // MARK: - actions
    // MARK: - accessors
    private let StoredLanguageKey:String = "com.SFLocalization.CurrentLanguage"/*记录当前用户选择的语言的缩写*/
    
    internal var currentLanguage:String? {
        set {
            UserDefaults.standard.setValue(newValue, forKey: self.StoredLanguageKey)
        }
        get {
            return UserDefaults.standard.value(forKey: self.StoredLanguageKey) as? String
        }
    }
    // MARK: - delegates
}

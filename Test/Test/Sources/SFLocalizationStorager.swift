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
    
    internal var currentLanguage:String {
        set {
            print(#function,newValue)
            UserDefaults.standard.setValue(newValue, forKey: self.StoredLanguageKey)
            UserDefaults.standard.synchronize()
        }
        get {
            let result:String? = UserDefaults.standard.value(forKey: self.StoredLanguageKey) as? String
            print("读取出来的值:\(result)")
            if result == nil {
                print(#function,"出现为空的情况")
                self.currentLanguage = "en"
            }
            print("最后读出来的值:\(result)")
            return UserDefaults.standard.string(forKey: self.StoredLanguageKey)!
        }
    }
    // MARK: - delegates
}

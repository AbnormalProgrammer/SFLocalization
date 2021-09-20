//
//  SFLocalizationManualMaker.swift
//  Test
//
//  Created by Stroman on 2021/9/19.
//

import UIKit

class SFLocalizationManualMaker: NSObject,SFLocalizationProtocol {
    // MARK: - lifecycle
    deinit {
        print("\(type(of: self))释放了")
    }
    
    override init() {
        super.init()
        self.customInitilizer()
    }
    
    convenience init(bundle sourceBundle:Bundle) {
        self.init()
        self.localBundle = sourceBundle
        self.dynamicBundle = sourceBundle
        self.languageStorger = SFLocalizationStorger.init()
    }
    // MARK: - custom methods
    private func customInitilizer() -> Void {
    }
    // MARK: - public interfaces
    /// 这里是通过动态生成bundle来实现的
    /// - Parameter abbreviation: 语言的缩写
    /// - Returns: 空
    internal func updateLanguage(language abbreviation:String) -> Void {
        let sourcePath:String = self.localBundle.path(forResource: abbreviation, ofType: "lproj")!
        self.dynamicBundle = Bundle.init(path: sourcePath)!
        self.languageStorger?.currentLanguage = abbreviation
    }
    
    internal func localLanguage(from key: String) -> String {
        return self.dynamicBundle.localizedString(forKey: key, value: "", table: nil)
    }
    
    internal func currentLanguage() -> String {
        return self.languageStorger!.currentLanguage
    }
    // MARK: - actions
    // MARK: - accessors
    private var localBundle:Bundle = .main/*默认的bundle资源*/
    private var dynamicBundle:Bundle = .main/*动态生成的bundle*/
    private var languageStorger:SFLocalizationStorger?/*持久化APP的语言选择*/
    // MARK: - delegates
}

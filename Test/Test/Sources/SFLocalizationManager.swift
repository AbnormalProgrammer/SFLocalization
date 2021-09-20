//
//  SFLocalizationManager.swift
//  Test
//
//  Created by Stroman on 2021/9/18.
//

import UIKit

public func localString(_ key:String) -> String {
    return SFLocalizationManager.sharedInstance.localLanguage(from: key)
}

public class SFLocalizationManager: NSObject,SFLocalizationProtocol {
    internal static let sharedInstance: SFLocalizationManager = {
        let instance = SFLocalizationManager.init()
        // setup code
        return instance
    }()
    private override init() {
        super.init()
        self.customInitilizer()
    }
    
    deinit {
        print("\(type(of: self))释放了")
    }
    
    // MARK: - custom methods
    private func customInitilizer() -> Void {
        
    }
    // MARK: - public interfaces
    /// 语言随系统变化而变化的
    /// - Parameter sourceBundle: 自定义的bundle
    /// - Returns: 空
    public func initAutoLanguage(targetBundle sourceBundle:Bundle = .main) -> Void {
        self.localBundle = sourceBundle
        self.autoLanguageMaker = SFLocalizationAutoMaker.init()
        self.autoLanguageMaker?.initWith(targetBundle: self.localBundle)
    }
    
    /// 手动控制的APP语言
    /// - Parameters:
    ///   - sourceBundle: 自定义的bundle
    ///   - abbreviation: 语言的缩写
    /// - Returns: 空
    public func initManualLanguage(targetBundle sourceBundle:Bundle = .main) -> Void {
        self.localBundle = sourceBundle
        self.manualLanguageMaker = SFLocalizationManualMaker.init(bundle: self.localBundle)
    }
    
    public func localLanguage(from key: String) -> String {
        var result:String = ""
        if self.autoLanguageMaker != nil {
            result = self.autoLanguageMaker!.localLanguage(from: key)
        } else {
            result = self.manualLanguageMaker!.localLanguage(from: key)
        }
        return result
    }
    
    public func updateLanguage(language abbreviation: String) -> Void {
        guard self.manualLanguageMaker != nil else {
            return
        }
        self.manualLanguageMaker?.updateLanguage(language: abbreviation)
    }
    
    public func currentLanguage() -> String {
        guard self.manualLanguageMaker != nil else {
            return ""
        }
        return self.manualLanguageMaker!.currentLanguage()
    }
    // MARK: - actions
    // MARK: - accessors
    private var localBundle:Bundle = .main/*bundle文件，默认是main bundle*/
    private var autoLanguageMaker:SFLocalizationAutoMaker?/*语言随iOS系统变化而变化的处理器*/
    private var manualLanguageMaker:SFLocalizationManualMaker?/*手动控制语言变化*/
    // MARK: - delegates
}

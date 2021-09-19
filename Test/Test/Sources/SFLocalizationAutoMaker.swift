//
//  SFLocalizationAutoMaker.swift
//  Test
//
//  Created by Stroman on 2021/9/18.
//

import UIKit
/*
 它负责处理语言随iOS系统变化而变化的场景
 */
class SFLocalizationAutoMaker: NSObject,SFLocalizationProtocol {
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
    /// 直接使用iOS系统当前的语言
    /// - Parameter path: 语言文件所在路径
    /// - Returns: 空
    internal func initWith(targetBundle sourceBundle:Bundle) -> Void {
        self.targetBundle = sourceBundle
    }
    
    internal func localLanguage(from key: String) -> String {
        return NSLocalizedString(key, bundle: self.targetBundle, comment: "")
    }
    
    func updateLanguage(language abbreviation: String) {
    }
    
    func currentLanguage() -> String {
        return ""
    }
    // MARK: - actions
    // MARK: - accessors
    private var targetBundle:Bundle = .main/*目标bundle，默认是main bundle*/
    // MARK: - delegates
}

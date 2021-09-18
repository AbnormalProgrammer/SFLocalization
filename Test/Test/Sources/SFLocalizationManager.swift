//
//  SFLocalizationManager.swift
//  Test
//
//  Created by Stroman on 2021/9/18.
//

import UIKit

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
    /// 初始化接口
    /// - Parameters:
    ///   - path: 各个strings文件的路径
    ///   - isAuto: 是否跟随系统语言变化
    ///   - listPath: APP中的语言列表
    /// - Returns: 空
    public func initWith(stringsFiles path:String,auto isAuto:Bool = true,languagesList listPath:String) -> Void {
        self.isAuto = isAuto
        if self.isAuto {
            self.autoLanguageMaker = SFLocalizationAutoMaker.init()
            self.autoLanguageMaker?.initWith(bundlePath: path)
        }
        self.stringsFilePath = path
        self.languageListPath = listPath
    }
    
    public func localLanguage(from key: String) -> String {
        var result:String = ""
        if self.isAuto {
            result = self.autoLanguageMaker!.localLanguage(from: key)
        }
        return result
    }
    // MARK: - actions
    // MARK: - accessors
    private var isAuto:Bool = true/*是否跟随系统语言变化而变化*/
    private var stringsFilePath:String = ""/*本地化字符串文件所在路径*/
    private var languageListPath:String = ""/*APP中所需要的语言种类的列表*/
    private var autoLanguageMaker:SFLocalizationAutoMaker?/*语言随iOS系统变化而变化的处理器*/
    // MARK: - delegates
}

//
//  SFLocalizationProtocol.swift
//  Test
//
//  Created by Stroman on 2021/9/18.
//

import Foundation


protocol SFLocalizationProtocol:NSObjectProtocol {
    /// 根据键值获取对应的本地化语言
    /// - Parameter key: 键
    func localLanguage(from key:String) -> String
}

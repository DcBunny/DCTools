//
//  RegexHelper.swift
//
//  正则表达式工具封装
//  重载=~操作符,能否方便的使用正则表达式进行判定
//
//  Created by DcBunny on 16/4/6.
//  Copyright © 2016年 DcBunny. All rights reserved.
//

import Foundation

/*
 *  正则表达式工具结构体
 *  封装了正则表达式操作,提供简化的判定接口
 */
struct RegexHelper
{
    let regex: NSRegularExpression
    
    init(_ pattern: String) throws {
        try regex = NSRegularExpression(pattern: pattern,
                                        options: .CaseInsensitive)
    }
    
    func match(input: String) -> Bool {
        let matches = regex.matchesInString(input,
                                            options: [],
                                            range: NSMakeRange(0, input.characters.count))
        return matches.count > 0
    }
}

/*
 *  重载=~操作符,作为正则表达式的判定操作符
 */
infix operator =~ {
    associativity none
    precedence 130
}

func =~ (lhs: String, rhs: String) -> Bool {
    do {
        return try RegexHelper(rhs).match(lhs)
    } catch _ {
        return false
    }
}

/*
 *  常用正则表达式
 *  mailRegex: 邮箱地址正则表达式
 *  phoneRegex: 手机号正则表达式
 *  userNameRegex: 用户名正则表达式
 *  pwdRegex: 密码正则表达式
 *  待补充
 */
let mailRegex = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
let phoneRegex = "^1[3|4|5|7|8][0-9]\\d{8}$"
let userNameRegex = "/^[a-z0-9_-]{3,16}$/"
let pwdRegex = "/^[a-z0-9_-]{6,18}$/"

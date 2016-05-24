//
//  HowToWrite-protocol-delegate.swift
//  test
//
//  Created by DcBunny on 16/5/24.
//  Copyright © 2016年 DcBunny. All rights reserved.
//

import Foundation

/*
 * protocol-delegate 模式是一种常用的设计模式，
 * 在 ARC 中，一般会将 delegate 指定为 weak，
 * 但是 swift 中的 protocol 是可以被 struct 和 enum 遵守的，
 * 而 struct 和 enum 是不通过 ARC 管理内存的，
 * 所以需要在声明 protocol 时指定只能由 class 类型实现，
 * 这样便可以用 weak 修饰
 */

protocol HTWClassDelegate: class {
    func method()
}

class HTWClass {
    weak var delegate: HTWClassDelegate?
}

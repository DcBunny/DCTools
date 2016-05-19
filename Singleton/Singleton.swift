//
//  Singleton.swift
//  test
//
//  Created by 李宏博 on 16/4/21.
//  Copyright © 2016年 DcBunny. All rights reserved.
//

import Foundation

/*
 *  对于一些希望能在全局方便访问的实例，
 *  或者在 app 的生命周期中只应该存在一个的对象，
 *  我们一般都会使用单例来存储和访问。
 *  
 *  Swift 1.2 之后的一种简洁的单例实现方法;
 *
 *  在初始化类变量的时候，Apple 将会把这个初始化包装在一次 
 *  swift_once_block_invoke 中，以保证它的唯一性;
 *
 *  另外，我们在这个类型中加入了一个私有的初始化方法，来覆盖默认的公开初始化方法，
 *  这让项目中的其他地方不能够通过 init 来生成自己的 MyManager 实例，
 *  也保证了类型单例的唯一性。
 */

class MyManager  {
    
    static let sharedInstance = MyManager()
    
    var a = "hello world"
    
    private init() {}
}

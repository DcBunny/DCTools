//
//  ViewController.swift
//  test
//
//  Created by DcBunny on 16/1/11.
//  Copyright © 2016年 DcBunny. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageSubViews()
    }
    
    //MARK: - 使用匿名的闭包模拟局部scope，隔离UI代码，优化规范性
    func loadPageSubViews() {
        titleLabel = {
            let label = UILabel(frame: CGRectMake(150, 30, 50, 40))
            label.textColor = UIColor.redColor()
            label.text = "Title"
            self.view.addSubview(label)
            return label
        }()
    }
}

//MARK: - 自省，判断对象属于的类型

/*
 *  自省，判断对象属于的类型
 */

// 只能对Class生效
func whoAmI1() {
    class ClassA { }
    class ClassB: ClassA { }
    
    let obj1: AnyObject = ClassB()
    let obj2: AnyObject = ClassB()
    
    if obj1.isKindOfClass(ClassA.self) {
        print("true")
    } else {
        print("false")
    }
    
    if obj2.isMemberOfClass(ClassA.self) {
        print("true")
    } else {
        print("false")
    }
}

// 除了用于Class，还可以用于struct和enum
func whoAmI2() {
    class ClassA { }
    class ClassB: ClassA { }
    
    let obj: AnyObject = ClassB()
    
    if (obj is ClassA) {
        print("属于 ClassA")
    }
    
    if (obj is ClassB) {
        print("属于 ClassB")
    }
}

//MARK: - 获取对象类型

/*
 *  获取对象类型
 */
func getObjClass() {
    let aString = "hello"
    print(aString.dynamicType)
    
    let aDate = NSDate()
    print(aDate.dynamicType)
}

//MARK: - optional protocol 的实现方法

/*
 *  optional protocol 的实现方法
 */
protocol OptionalProtocol {
    func optionalMethod()        // 可选
    func necessaryMethod()       // 必须
    func anotherOptionalMethod() // 可选
}

extension OptionalProtocol {
    func optionalMethod() {
        print("Implemented in extension")
    }
    
    func anotherOptionalMethod() {
        print("Implemented in extension")
    }
}

class MyClass: OptionalProtocol {
    func necessaryMethod() {
        print("Implemented in Class3")
    }
    
    func optionalMethod() {
        print("Implemented in Class3")
    }
}

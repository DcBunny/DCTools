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
    var btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - 使用匿名的闭包模拟局部scope，隔离UI代码，优化规范性
    func loadPageSubViews() {
        titleLabel = {
            let label = UILabel(frame: CGRect(x: 150, y: 30, width: 50, height: 40))
            label.textColor = UIColor.redColor()
            label.text = "Title"
            view.addSubview(label)
            return label
        }()
        
        btn = {
            let button = UIButton(frame: CGRect(x: 150, y: 100, width: 80, height: 40))
            button.setTitle("Button", forState: UIControlState.Normal)
            button.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
            view.addSubview(button)
            button.addTarget(self, action: #selector(click), forControlEvents: UIControlEvents.TouchUpInside)
            return button
        }()
    }
    
    func click() {
        print("click")
    }
}

//MARK: - Selector的优雅写法
private extension Selector {
    static let buttonTapped =
        #selector(ViewController.buttonTapped(_:))
}

//MARK: - 分离属性的访问域

/**
 * 分离属性的访问域
 * name的get方法为默认的internal，可在同一module(target)中访问
 * name的set方法为private，限于本文件内访问，即在MyClass类中访问
 */
class MyClass {
    
    private(set) var name: String   // 分离属性的访问域
    
    init(name: String) {
        self.name = name
    }
    
    func setName(name: String) {
        self.name = name
    }
}

//MARK: - 对Log输出的封装
/**
 * 对swift Log输出的封装
 * 包含所在文件，行号，方法，和Log信息
 * 同时可以指定编译条件
 */
func printLog<T>(message: T,
              file: String = #file,
              method: String = #function,
              line: Int = #line)
{
    //    #if DEBUG
    print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    //    #endif
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

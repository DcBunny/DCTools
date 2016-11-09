//
//  Shakeable.swift
//  Training
//
//  Created by 李宏博 on 2016/11/9.
//  Copyright © 2016年 bdb. All rights reserved.
//

import UIKit

/*
 * 面向协议的视图
 *
 * 以 protocol 的方式为 UIView 添加 shake 方法
 * 任意需要抖动的视图遵循 Shakeable 协议即可，包含自定义及系统视图
 *
 */

protocol Shakeable {}

extension Shakeable where Self: UIView {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 4, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 4.0, y: center.y))
        layer.add(animation, forKey: "position")
    }
}


class ShakeImageView: UIImageView, Shakeable {}

extension UIButton: Shakeable {}

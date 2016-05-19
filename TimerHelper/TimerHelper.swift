//
//  TimerHelper.swift
//  test
//
//  Created by DcBunny on 16/5/19.
//  Copyright © 2016年 DcBunny. All rights reserved.
//

import Foundation

/*
 * 利用 GCD 实现的定时器
 * time 秒后执行某操作
 * 并且可以取消操作
 */

class TimerHelper {
    
    typealias Task = (cancel: Bool) -> Void
    
    class func delay(time: NSTimeInterval, task: ()->()) -> Task? {
        
        func dispatch_later(block: ()->()) {
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW,
                    Int64(time * Double(NSEC_PER_SEC))),
                dispatch_get_main_queue(),
                block)
        }
        
        var closure: dispatch_block_t? = task
        var result: Task?
        
        let delayedClosure: Task = {
            cancel in
            if let internalClosure = closure {
                if (cancel == false) {
                    dispatch_async(dispatch_get_main_queue(), internalClosure);
                }
            }
            closure = nil
            result = nil
        }
        
        result = delayedClosure
        
        dispatch_later {
            if let delayedClosure = result {
                delayedClosure(cancel: false)
            }
        }
        
        return result;
    }
    
    class func cancel(task:Task?) {
        task?(cancel: true)
    }
}

//
//  EasyTime.swift
//  Training
//
//  Created by 李宏博 on 2016/10/31.
//  Copyright © 2016年 bdb. All rights reserved.
//

import Foundation

/*
 *
 * 简化对时间的计算
 *
 */

protocol Time {
    var inSeconds: Double { get }
}

struct Hours: Time {
    let value: Double
    
    var inSeconds: Double {
        return value * 3600
    }
}

struct Minutes: Time {
    let value: Double
    
    var inSeconds: Double {
        return value * 60
    }
}

struct Seconds: Time {
    let value: Double
    
    var inSeconds: Double {
        return value * 1
    }
}

func + (lhs: Time, rhs: Time) -> Time {
    return Seconds(value: lhs.inSeconds + rhs.inSeconds)
}

extension Time {
    var inMinutes: Double {
        return inSeconds / 60
    }
    
    var inHours: Double {
        return inMinutes / 60
    }
}

extension Int {
    var hours: Time {
        return Hours(value: Double(self))
    }
    
    var minutes: Time {
        return Minutes(value: Double(self))
    }
}

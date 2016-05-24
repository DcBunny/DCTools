# 工作学习中积累的代码

## Tips
[Tips](ViewController.swift)：学习过程中积累的一些 Tips.

## RegexHelper
[RegexHelper](RegexHelper/RegexHelper.MD)：通过对`NSRegularExpression`进行封装，对`=~`操作符进行重载，提供简洁的正则表达式判定方法。

## 单例模式实现
[Singleton](Singleton/Singleton.swift)：Swift 1.2 之后的一种简洁的单例实现方法，参考文章 [单例](http://swifter.tips/singleton/)。

## 基于GCD的可取消定时器
[TimerHelper](TimerHelper/TimerHelper.MD)：基于 GCG 实现的可取消定时器，可以延迟 timer 秒执行操作。

## Swizzle
[Swizzle Example](SwizzleExample/SwizzleExample.swift)：利用swizzle的方法的runtime，实现button的点击统计。

## MD5Helper
[MD5Helper](MD5Helper/MD5Helper.swift)：通过调用C动态库，实现MD5。

## Protocol - delegate 模式的正确写法
[Protocol - delegate 模式](HowToWrite-protocol-delegate/HowToWrite-protocol-delegate.swift)：protocol-delegate 模式是一种常用的设计模式，在 ARC 中，一般会将 delegate 指定为 weak，但是 swift 中的 protocol 是可以被 struct 和 enum 遵守的，而 struct 和 enum 是不通过 ARC 管理内存的，所以需要在声明 protocol 时指定只能由 class 类型实现，这样便可以用 weak 修饰。
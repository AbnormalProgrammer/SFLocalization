# SFLocalization
我自己写的本地化组件。
## 演示
![示例](https://github.com/AbnormalProgrammer/SFLocalization/raw/main/resources/demo.gif)
## 有啥用？
1. 可以让APP语言随系统变化而变化。
2. 可以在APP内手动切换语言。
3. 可以持久化APP所选的语言，再次进入APP可显示上次APP退出时候的语言。
## 啥原理？
语言随着iOS系统变化这个没啥好讲的。<br>
APP内切换语言是每次根据目标语言所在工程目录动态生成的bundle，调用这个bundle的localizedString来实现的。每次更新APP语言都是通过UserDefaults来持久化的。
## 如何使用？
在使用多语言之前你首先要创建`Localizable.strings`，然后把它给本地化才行。
在APP启动的时候，如果是语言选择随系统变化而变化，调用如下。<br>
```
SFLocalizationManager.sharedInstance.initAutoLanguage()
```
如果是想APP内切换语言可以这样<br>
```
SFLocalizationManager.sharedInstance.initManualLanguage()
SFLocalizationManager.sharedInstance.updateLanguage(language: SFLocalizationManager.sharedInstance.currentLanguage())
```
调用的时候<br>
```
self.targetLabel.text = localString("testkey0")
```
## 遗留问题
1. 通过啥方式实现UI的自主更新语言呢？<br>
还是选择更换根视图控制器吧。因为单独刷新就必须要重新赋值，而重新赋值就必须牵涉到业务逻辑，而业务逻辑是可能极其复杂。
## 使用方法
使用Cocoapod导入`pod 'SFLocalization', '0.0.2'`<br>
在使用的地方引入`import SFLocalization`

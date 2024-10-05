# 更新历史
## 遗留优化 TODO
- 增加定义快捷键查找功能 @xfold-shortcuts.xlsx
- 与CapsLocks+冲突问题，如 CapsLock+F1
- 解析热键定义中的保留字符使用 ; , - 通过anltr词法解析
- 增加组合键扩展 LButton+a e / Ctrl+k,Ctrl+d - 思路 hotstring-zmd，并击
- 增加代码注释自动生成文档 类似jsdoc AHKDoc
- 自动化测试/用例
- 打包后支持自定义脚本扩展功能 LexAHKL.dll
- 迁移到Autohotkey2.0
- funcCmd与open区分使用，funcCmd 标准函数方式，open在funcCmd扩展支持命令行及路径
- 插件 cmd+hotkey+hotstirngs
- 整理xfold-base.ahk 函数有些乱
- 项目工程重新构建

## @issue
- xfold.ini 需要保存文件编码 UTF-16 LE with BOM
- xfoldCmdlineRun中以.md类似结尾误解析为命令动作，例如 f xfold设计思想.md - 暂命令在最后添加空格规避
- 使用虚拟键盘输入 设置了快捷键的字符无法输入 - 原因：虚拟键盘输入时LButton为按击状态 LButton+f。 getLBtnState - 通过开关规避解决 toggleVLBtnEnabled
- ; , 为保留字符，命令行中参数包含时存在错误解析 


## 20240916: 1.2.2
+ 新增重做上次执键功能 redoHotkey()
+ 新增打开应用或文件时显示已打开 ashow() - "assure-show"
+ 新增执行批量命令 runs/runcmds
* bugfix d:\not-exist-file.txt
* 解决编译exe无法运行问题
* 修改默认日志级别: error
* 清理硬编码的hotstings - spanish-accents
* xfold-cmd cmd增加连字符的支持 gtd-in
* 修改增强使用run命令行执行对应动作 for xmd.exe keys-\*.txt
* 整理配置文件


## 20240818: 1.2.1
+ 增加支持多配置文件，默认：xfold.ini, 扩展配置命名：xfold-\*.ini 加载顺序按名称倒序
* 整理代码并修复部分问题


## 20240609: 1.1.12
* 解决命令行窗口只能呼出一个的问题 delay(10,xfoldCmdline)
* xfold-cmd命令行窗口，ctrl+enter vgo, shift+enter 使用选择文本填充参数


## 20240526: 1.1.11
+ 增强send功能，增加支持回调callback功能
    * 使用示例send({space}^v@,500,strd);callback(strd,send,offDate())
+ 增加支持在任意输入框中，快速执行命令行 ..r
    * :*?xo:..r=zmd:send(+{home}^c{end});delay(100, xfoldCmdlineRun, {%c})
+ 增加支持快速输入系统或配置变量的值 ..v
    * :*?xo:..v=zmd:send(+{home}^c{end});delay(100, sendvcfg, {%c})
* 规避使用包含特殊字符作为参数的问题
    * 增加从文件临时保存提取字符串功能@xfold-value.ahk vget, vset, vappend, vsetarr
    * 增加当前选择文本临时保存 vselect(v)
    * 增加发送临时保存的字符串 vsend(v)
    * 增加将临时保存的字符串写入剪贴板，供后续粘贴使用 vclip(v)
* 修正xfoldCmdline输入不存在的命令时的处理错误
* 重新打包xfold.exe
    

## 20240218: 1.1.10
+ 增加虚拟键LButton按下及释放功能，无鼠标时也可使用LButton+e等功能
    * 例： $F12 $F12 => setLBtnOn(2000) 临时按下虚拟键LButton，2秒后释放 @keys-leexioua.txt
    * 例： ^/ ^/ => setLBtnOn(2000) 临时按下虚拟键LButton，2秒后释放 @keys-leexioua.txt
    * 例： ^\ ^\ => toggleLBtnOn() 保持按下虚拟键LButton @keys-leexioua.txt
    * 例： LButton+^\ ^\ => toggleLBtnOn() 释放虚拟键LButton @keys-leexioua.txt
+ 增加窗口最大化、最小化、还原、窗口置顶的命令行功能
    * max,min,restore,top
+ 延迟调用delayCall增加别名delay
    * preview(%A_ScriptDir%\xfold-cmd.csv);delay(300,showQuickLook);delay(500,winmax)
+ 命令行窗口执行命令时，按Shift或Ctrl键+Enter，自动复制选择文本内容作为用户输入的参数执行命令行
+ 增加SpaceFn, BackslashFn插件功能，Space或\键代替LButton功能。生效切换开关Ctrl+Win+Space, Ctrl+Win+\
+ 增加hotstring-cmd功能，可支持特定应用内生效
    * 例 :*xo:zmdyw=zmd:send(%A_YWeek%)
    * 例 :*xo:zzf=zmd:f {%x}
    * 例 :*b0:hip@chrome={bs 3}122.96.12.2
+ 增加Everything-cmd功能，在Everything 输入框中使用组合键Ctrl/Shift+Enter可执行xfold cmdline
* 调整部分热键设置 @leexioua.txt
    * SwitchOn+ 增加PotPlayer支持Youtube常用热键
    * 其它调整
* 整理补充更多命令行方法 @xfold.ini
    * 窗口相关操作等

## 20231005: 1.1.9
* 增加临时LButton按下功能setLBtnOn，不使用鼠标左键也可完成其组合键功能，如 LButton+f
* 增加cmd参数支持，支持引用上一次临时获取的字符内容 {%l} 或 {%last} 
* 增强打开功能，支持提取结尾的路径执行打开, LButton+r r r r => run(rstr({%x}))  @keys.user.txt
* 解决长时间不按键再次按键误判问题，增加2s间隔条件
* 其它优化

## 20230708: 1.1.8
+ xfold-cmd 优化命令处理优先级，配置项自定义动作 > 内置动作 > 系统cmd
+ 优化参数变量读取优先级  用户value() > 配置项 > ahk运行变量 > 环境变量
+ 资源管理器保存剪贴板内容文件名支持配置，配置项名 QuickSaveFileName 默认值 readme@xfold.md
+ 增加sendif(keyword, keys, delay := 0) 满足条件才发送，检查匹配窗口标题，进程名称是否包含关键词
    * 例： sendif(exe:notepad.exe, 123)
    * 例： sendif(title:标题, 123) or sendif(标题, 123)
+ 修正send延时发送包含特殊字符时一直发送的问题
* 托盘菜单增加打开xfold-dist@github项目首页的菜单项
* 配置优先级应高于系统应用解决 edit D:\Links\ahk\xfold\xfold-base.ahk
* 调整优化默认快捷键定义 @keys-default.txt, @keys-user.txt
* 调整优化cmds定义 @xfold.ini

## 20230528: 1.1.7
+ 增加 xsend(key, count:=1, lbtn:=false, title := "") 发送xfold快捷键,调用对应功能
+ 优化Cmds定义 @xfold.ini。加载逻辑同Settings，优化加载读取 [Cmds]，未读取到再加载[Cmds-default]
+ 优化Hotstrings定义 @xfold.ini。加载逻辑同Settings，优化加载读取 [Hotstrings]，未读取到再加载[Hotstrings-default]
+ 增加QuickLook窗口激活功能 例： Tab@explorer => showQuickLook({Tab})
+ 增加show(title) 激活显示标题中包含指定文本的窗口，有多个窗口匹配时显示最近打开的窗口
+ 增加xstr(str) 转义相关保留字符, ",",";","@","(",")"
+ 增加xfold-cmd命令行功能，支持以下命令格式
    * cmd:      g table
    * cmd pipe: table>g
    * function: g(table)
+ 整理 xfold-cmd 命令行参考 @xfold-cmd.csv
+ xfold-cmd打包命令行工具 xmd.exe @xfold-cmd.ahk
* 更新打包应用的icon
* 补充调整快捷键定义 @keys-leexioua.txt
* 补充调整Cmds定义 @xfold.ini
* Esc代替LButton快捷键，未知原因失效 - 已恢复

## 20230514: 1.1.6
+ 增加在资源管理器中复制路径功能 !c@explorer.exe => getCopyText 
* 移除其它可直接配置实现的插件
* 优化发送命令行功能 xfold(cmd)
* 修复可执行程序版本找不到图标文件错误

## 20230512: 1.1.5
+ 增强xfold-cmd，检测xfold脚本或可执行程序运行，提供外部发送命令调用接口 例：xfold-cmd.exe en table
+ 增加脚本编译可执行选项设置
+ 增加托盘菜单，菜单增加重新加载配置及关于功能
* 快捷键定义解析处理优化，读取行后移除行尾注释(行最后包括空格分号的字符串) 例：!c@sublime_text.exe => xxx ; copy path@sublime_text 
* 移除seer插件

## 20230508: 1.1.4
+ 增加后台运行打开功能, 命令行以“ -hidden” 例：open("xxx -hidden")
+ 增加 delayCall 支持动作方法的延迟调用 例：delayCall(2000, "send", "!r")
+ 增加开关型扩展快捷键，需要在手动打开开关，快捷键才生效，手动关闭后，快捷键失效。 场景问题： e@chrome.exe => open(https://youdao.com/result?word={%x}&lang=en) 将会影响输入框输入字符e
    1. 定义开关型快捷键，快捷键前加“SwitchOn+” 例：SwitchOn+e@chrome.exe => open(https://youdao.com/result?word={%x}&lang=en) 
    2. 使用时需要手动打开开关。 可使用默认快捷键: $F1 $F1 或者 Ctrl+Shift+\  (开关快捷键修改参考: $F10 $F10 => toggleSwitchOn)
+ 增加热字串的配置功能
    1. 在 xfold.ini-[Hotstings] 中定义 例 ::@@=leexioua@gmail.com 输入“@@”后再空格，替换为leexioua@gmail.com
    2. 参考AutoHotKey文档 https://wyagd001.github.io/zh-cn/docs/lib/Hotstring.htm （或 https://www.autohotkey.com/docs/v1/Hotstrings.htm ）
* 修正优化stripLine问题，移除行首markdown项目符号
* 修正同一快捷键在多个特定应用中只会在第一应用中生效的问题 bindKey


## 20230423: 1.1.3
+ send 增加延时发送 setTimer 例：send(%clipboard%, 1000)
+ {%p} 参数记录用户最后一次输入，作为输入框默认值
+ funcCmd 支持嵌套使用 例：alert(title())
+ 增强 funcCmd 支持函数命令行形式的CMD调用 例： en desk <=> en(desk) 
+ 增强 funcCmd 参数传递{%p}使用，不需要用户交互输入 例： en({%p}): en desk
+ 增加自定义命令功能：
    1. 在 xfold.ini-[Cmds] 中定义 例 gi=https://www.google.com/search?q={%p}&tbm=isch
    2. 快捷键配置 LButton+i => gi ， 或者传递参数方式 LButton+i => gi({%x})
+ Esc 替代 LButton 逻辑优化，按键后不释放
+ 开放xfoldCmd(cmd) ==> funcCmd(cmd) 给外部脚本调用，例：xfoldCmd("send(!r)")
+ 增加 invokeKeyCmd/getKeyCmd 方法，支持直接执行快捷键动作
* 配置项对快捷键配置增加支持多文件叠加，以分号 (;) 分隔。 例：keymappings=%A_ScriptDir%\keys-default.txt;%A_ScriptDir%\keys-leexioua.txt
* 提升发送级别，可发送本脚本监听快捷键 -> SendLevel 1
* 部分日志清理为 debug 日志
* 其它优化

## 20230413: 1.1.2
+ 增加 value(key, val) 提供保存用户变量，以便后期使用。 例： LButton+w => value(hwid, {%x});open(notepad);send({Text}%hwid%, 2000)
* 修正 F8长按失效问题  用例：$F8 $F8 $F8 $F8 => open(autohotkey.exe D:\Links\filelocator\locator-cmd.ahk {%p})
* 修正 资源管理器中保存剪贴板内容不信赖标题显示完整路径设置 @explorer_clipboardSave2Txt
* 增强 在资源管理器中 Alt+e 文本编辑选中文件 例： !e@explorer.exe => edit({%x})

## 20230409: 1.1.1
+ 通过配置文件定义热键绑定，方便后续 ahk2exe 打包可执行文件发布。 
    * 默认热键映射配置文件 keys-default.txt 如需更改为其它文件名称，可在 xfold.ini - [settings] - keymappings 中修改

## 20230408: 1.1.0
+ 项目取名 xfold ， 修改相关文件及目录命名，xfold初始版本为1.1.0
+ 增加配置文件常量定义，变量值中支持嵌套变量
```js
[Constants]
ProgramxFiles=D:\ProgramxFiles
[Settings]
editor=%ProgramxFiles%\SublimeText\sublime_text.exe
```
+ 增加重做最近一次动作 redo ，类似excel F4功能。 热键: F4 F4 => redo , F12 F12 => alertLastCmd
+ ahk脚本实现收集保存内容功能 saveNotes 。 LButton+s => saveNotes
+ open 动作支持快速打开注册表路径 依赖 regjump.bat 例：open(HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit)
+ 个人自用脚本打包供参考 cmds\cmds-by-leexioua.zip
* 修复Esc存在多次发送问题 @xfold-init-keybinding.ahk
* 调整应用框架代码，重命名，目录位置
* 修改命名 holdLBtnAfterAction => noReleasingLBtnAfterAction

## 20230330: 1.0.11
+ 整理简化不必要的动作方法 @leexioua-actions.ahk
+ 增强funcCmd支持ahk系统变量 例 %A_ScriptDir%
+ 增加 LButton+c => Ctrl+c, LButton+x => Ctrl+x, LButton+v => Ctrl+v, LButton+z => Ctrl+z
+ 支持默认及用户键映射定义扩展 例 @leexioua-keys-default.ahk @leexioua-keys-sean.ahk
* 整理默认通用键映射配置 减少依赖 @leexioua-keys-default.ahk
* 修改自用键映射配置文件命名 @leexioua-keys-sean.ahk 
* 优化 open 动作，打开网页时参数拼接，参数前不补空格 open("https://www.google.com/search?q=","{%x}")
* 优化 open 动作，捕获运行异常并提示用户
* 修改配置文件编码为UTF-16 @leexioua-ahk.ini
* 整理脚本入口，分离基础与个性化的功能，以便后续使用用户自主选择或扩展增强功能 @leexioua-ahk.ahk
* 优化 stripLine , 增加 # ; 等引导符剥除
* 优化增加默认参数 \[Settings-default\] @leexioua-settings.ahk

## 20230324: 1.0.10
+ open(cmd)/funcCmd(cmd) 增加支持临时复制选择文本的参数 {%x}
+ 增加 title(removeTail:=True) ，获取当前窗口的标题到剪贴板
+ 增加 process ，获取当前窗口的进展名到剪贴板
+ 增加 LButton+r长按 => run({%p})，支持运行内置的动作
+ 增加 plugin-markdown.ahk 支持将剪贴板图片/图片路径，复制成markdown DataURI形式 !\[pic\](data:image/png;base64,xxx)
* 修正funcCmd(cmd) {%p}参数不生效问题
* open 增加别名 run ，open(notepad) <==> run(notepad)
* 修改命名 holdingLBtnAfterAction => holdLBtnAfterAction

## 20230318: 1.0.9
+ 增加支持长按热键，热键定义键数4次以上认为是长按绑定定义 @leexioua-keybinding.ahk 用例: LButton+n n n n => open(notepad)
+ open(cmd)/funcCmd(cmd)增加支持用户输入参数{%p}与剪贴板文本{%c}，例: http://www.google.com/search?q={%p}
+ open(cmd) 增强扩展其功能，调用Run失败会再尝试调用funcCmd方法
+ 增强 funcCmd（cmd)  热键可支持执行多个函数 用例：r r@notepad.exe => alert(123);info(1334);alert(333)
+ 增加 holdingLBtnAfterAction(key, enable)， 用于控制是否在执行动作后释放{LButton up} 用例: holdingLBtnAfterAction("1@explorer.exe", true)
+ 增加插件 plugin-configbak 用于备份个人使用软件的相关配置文件
+ 增加 ctrl+e e => eudic
+ 引入日志模块，方便问题定位
* 优化修改击键弹起触发热键, 即按键释放时触发
* 优化当只有单个按键热键，不需要等待下一次按键判断，单键热键动作无延时 用例: ^d@sublime_text.exe => send(^+k)
* 优化扩展相关动作参数，无参数时使用复制选择内容/剪贴板内容 例: eudicQuery(word:="") @ leexioua-actions.ahk
* 清理可简单使用funcCmd()实现的方法 @leexioua-actions.ahk 例: keymapping() => edit(%Help_keymappings%)
* 增加依赖到脚本目录下的Lib  Acc.ahk, Anchor.ahk
* 修正funcCmd（cmd)参数解析问题
* LButton+r => openOrRun 优化支持环境变量, 用户输入参数

## 20230314: 1.0.8
+ 配置参数名称优化， 统一使用getCfgValue()
+ 验证已支持组合键扩展 (Ctrl+c c) 用例：$^o $^o => SafeActivate(%eudic%)
+ 相关插件注册热键改用bindHotKey()
* 修正bindHotkey不支持LButton+w w问题
* 键映射调整，参考 leexioua-shortcuts-ahk.xlsx
* 修正WinActive title参数错误 用例：r r@notepad.exe => alert(123)

## 20230307: 1.0.7
+ 增加热键 ` => ALTRun `` => clQBar@CapsLock+
+ 支持同一热键在不同应用中执行不同的动作  LButton+f f@sublime_text.exe => findIt, LButton+f f@notepad.exe => alert(123)
+ 动作支持变量, 系统环境变量 或配置项的值 例: SafeActivate(%Path_eudic%)", eudicQuery(%clipboard%)
+ 支持Esc+单键，双键与三键，等同LButton键组合, Esc+f =>LButton+f
* 重构 keybinding, 将plugin-keymapping 合并
* 修正绑定单键热键时，字符输入失效问题 1 1 =>  open(notepad)
* 修正插件与keybinding插件热键注册冲突问题

## 20230303: 1.0.6
* 重写配置加载模块，启动时动态加载配置， 简化了新增参数需要使用的代码行
* 部分键绑定调整 leexioua-keys-keymappings.ahk
* 其它优化增强

## 20230221: 1.0.5-beta
+ keymapping配置支持使用含参数的方法调用 例：open(notepad.exe), edit(D:\ProgramxFiles\MouseInc\MouseInc.json)
+ 新增公共方法供keymapping配置使用，打开程序/文档/网址 open(cmd), 文本打开编辑文件 edit(filename) 
+ 增加keepass插件，功能检查并确保keepass已打开运行
* 修复SafeActivate() 等待窗口打开后发送按键功能
* CapsLock+单键 绑定带参数的方法错误, 例 LButton+x => open(xxx) 
* 取消 CapsLock+单键 => LButton+单键功能，预留CapsLock 作其它用途
* 改写标签方式的应用的热键功能实现，修改为插件方式实现
* 提高发送按键的层级优先级，确保外部ahk应用热键可接收到
* 修正由于插件加载顺序引起keymapping不能注册成功
* 按键名称转义发送效率优化 escKeys4Send(A_ThisHotkey)
* 增加markdown快速标记复选框完成状态 暂使用 LButton+x x => @sublime text

## 20230214: 1.0.4
+ 新增插件简化热键配置 plugin-keymapping.ahk ，如: LButton+e e
* 修改资源管理器文件对话框中热键 Ctrl+Q (快速跳转Quick)
* 其它优化， 复制文本预处理使用统一方法

## 20230210: 1.0.3-beta
+ 新增配置项集中管理 leexioua-ahk.ini
+ 新增ahk-cmd.ahk 动态ahk脚本发送到AltRun
+ 新增资源管理器文件对话框中 Ctrl+Alt+D 快速跳转到当前活动的目录

## 20230208: 1.0.2
+ 新增知乎搜索 LButton+z
+ 新增searchAhkSource - F8双键
+ 新增LButton+Tab -> Alt+Tab 切换窗口 @leexioua-lbl-global.ahk
+ 新增打开查看leexioua-shortcuts-ahk.xlsx (快捷键帮助), LButton+F1
+ 新增保存资源管理器剪贴板文本到文件 readme@leexioua.md @leexioua-lbl-explorer.ahk - 需要资源管理器选项设置 在标题栏中显示完整路径
+ 新增格式刷热键 Ctrl+Shift+c @leexioua-lbl-excel.ahk
+ 新增everything-cmd, evernote-cmd, mail-cmd 搜索关键词发送到AltRun， ahk-func中方法发送到AltRun
* leexioua-actions 修改相关方法名称

## 20230203: 1.0.1
* 修正viewAhkFile 路径拼接错误
* 修正plugin-keysfunc调用异常，键失效问题
* 修正plugin-keysfunc countKeys SetTimeout 偶尔绑定失败后，键失效问题
+ 新增 copyTitleText， copyTitleTextLine for LButton+t t

## 20230127: 1.0
+ 代码重新整理，模块化，规范代码，按功能和应用结构分享代码；插件加载方式方便根据需要修改加载
+ 增加多键热键支持，扩展更多可定义的热键  LButton+多键 （单键，双键，三键）
+ 热键键定义整理集中管理，方便维护 leexioua-keys-*.ahk, leexioua-lbl-*.ahk
+ 增加MACC支持，依赖Acc.ahk, Ankor.ahk  增加ADC新增任务的功能
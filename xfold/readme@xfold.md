# 软件说明 \<xfold\> ten-fold

## 设计背景
- 软件名称源于编写初衷： 折叠时间 <=> ten-fold（十倍效率）
- 解决需要经常执行的操作场景，折叠节省重复操作的时间
	+ 如网页搜索，查单词，查找本地文件，打开常用文件等等
- 软件当前主要为自用，配置快捷键偏技术略复杂，另相关动作扩展可能需要编码，使用门槛偏高

## 功能简介
```js
ten-fold（十倍效率）主要是配置定义常用功能的快捷键小工具。
通过扩展LButton组合键，双键，三键以及长按的快捷键，缓解快捷键占用以及不容易记忆的问题。
快捷键的操作动作支持如打开文件，目录，网址以及打开窗口，发送按键等常用动作。
默认配置了部分实用功能，可作为参考示例，简单修改定义自己习惯的快捷键及触发动作任务。
```
### 功能示例
- 英语查词 - 选择文本后 LButton+e
- 文本编辑器打开 - 选择文本或文件后 LButton+a
- 快捷Everything查找文件 - 选择文本或文件后 LButton+f @依赖Everything
- 快速打开 - 选择文本后 LButton+r
- Welink发消息 - 选择文本后 LButton+w
- W3查询人员信息 - 选择文本后 LButton+3/LButton+w w
- 复制窗口标题及选择内容 - *选择文本后 LButton+t / LButton+t t / LButton+t长按
- 笔记收藏 - 选择文本后 LButton+s
- 在资源管理器中，保存剪贴板内容为文件 LButton+Ctrl+v
- 在资源管理器中，文本编辑器打开 Alt+e
- 在文件打开保存对话框中，跳转到当前资源管理器活动的目录 Ctrl+Q
- 常用搜索
	+ Google: - 选择文本后 LButton+g
	+ Baidu: - 选择文本后 LButton+b
	+ Zhihu: - 选择文本后 LButton+z
	+ Douban: - 选择文本后 LButton+d
- 热字串替换功能，支持扩展定义 如：输入"]d" 替换为 20230508 即当天时间的字符串
- 以上为内置的默认功能，可配置扩展定义更多

## 主要创新
- 扩展LButton组合快捷键，如LButton+e，指按住鼠标左键LButton再击键e，这类快捷键在鼠标划词或选择文本或文件后操作比较方便。
	+ Tips: LButton组合键，LButton可用ESC键代替，ESC+e <==> LButton+e (不足：当操作的窗口按Esc触发关闭情况 仍需要使用LButton+e)
- 扩展双键，三键，长按快捷键 支持定义更多的快捷键, 帮助解决快捷键占用，不足以及难记忆的问题
- 支持定义只在特定应用内生效的局部快捷键 如：e@chrome.exe => open("http://xxxx")
- 设计动作定义参数，并提供友好输入，如使用系统环境变量，配置变量或人工输入等 %appdata% {%p} {%c} {%x}

## 快捷键速查
- xfold-shortcuts.xlsx
- xfold-shortcuts-default.pdf
- xfold-shortcuts-leexioua.pdf

## 环境准备依赖
- 软件运行环境
	+ 必备：xfold.exe or AutoHotkey.exe
	+ 以下推荐及可选软件，为本人个人使用，自用脚本涉及使用
	+ 推荐：sublime_text.exe
	+ 推荐：Everything
	+ 推荐：英语词典 eudic
	+ 可选：ALTRun
	+ 可选：MouseInc
	+ 可选：CapsLock+
	+ 可选：QTTabBar
	+ 可选：welink
	+ 可选：FileLocator
	+ 可选：Active Desktop Calender
	+ 可选：QuickLook
- 个人自用脚本参考
	+ 已打包保存在 cmds\cmds-for-leexioua.zip
- 系统环境变量：可选 (脚本运行需要设置)
	+ Path=%Path%;D:\ProgramxFiles\AutoHotkey\AutoHotkey.exe
- 更多 >> 软件配置项：xfold.ini

## 快捷键配置说明
- 默认快捷键配置文件 keys-default.txt 如果需更改为其它文件名称，可以在 xfold.ini - [settings] - keymappings项修改
- 参考配置示例，增加修改即可，映射包括快捷键及动作两部分 以 “=>” 分隔
	+ 如 ^m => SafeActivate(%eudic%) 中
		* ^m 为快捷键， SafeActivate(%eudic%) 为动作
	+ 如果同一快捷键被定义多次，只有最后一次定义生效，不是所有定义生效，即不会触发多个动作，采取覆盖更新原则
		* 如果需要触发多个动作，动作列表可使用分号 (;) 分隔进行定义
### 快捷键定义
- 快捷键修饰符
	+ \# => Win 、 ^ => Ctrl 、 ! => Alt 、 \+ => Shift
	+ 例： ^m => Ctrl+M  #f => Win+F
	+ Autohotkey 参考： https://www.autohotkey.com/docs/v1/Hotkeys.htm#Symbols
- 通用组合
	+ 单键 single-press
		```js
		^m => SafeActivate(%eudic%)
		```
	+ 双键 double-press
		```js
		^q ^q => send(!{F4})
		```
	+ 三键 treble-press
		```js
		$F1 $F1 $F1 => open(notepad.exe)
		; 此处按键F1前的$ 为避免多键快捷键的自我触发
		```
	+ 长按 holding-press
		```js
		重复四次及以上视作长按
		$F1 $F1 $F1 $F1 => alert("holding-pressed: F1")
		```
	+ LButton组合键
		```js
		LButton+a => edit
		LButton+g => open(https://www.google.com/search?q={%x})
		LButton+e e => open(https://youglish.com/pronounce/{%x}/english?)
		LButton+t t t => copyWinTitle
		LButton+t t t t => title
		```

- 全局与特定应用生效
	+ 快捷键后跟 @应用进程名称 例： /@SumatraPDF.exe
		```js
		/@SumatraPDF.exe => open(%Help_SumatraPDF%)
		$F8 $F8@sublime_text.exe => srcAhkSearch
		```
### 动作定义
- 内置动作函数
	```js
	^(\w+)\(.*\)
	参考：keys-default.txt
	示例：
	open(notepad)
	```
	
	```js
	open(cmd, param := "")
	run(cmd, param := "")
	edit(filename)
	preview(filename)
	reload()
	send(keys, delay := 0)
	sleep(delay)
	safeActivate(program, activate:=True, miniWhenActive := False)
	value(key, val := "")
	saveNotes(text := "")
	alert(str, args*)
	info(message, args*)
	tooltip(str := "")
	redo()
	title(removeTail := true)
	process()

	alertLastCmd()
	clipboard(content := "")
	escape4Markdown(strContent)
	funcCmd(cmd, param := "")
	getClipboardIfNull(default:="", stripContent := true)
	getDerefStr(str, depth := 0)
	getFileName(fullpath)
	getFilePath(fullpath)
	getSelectText()
	isTrue(v)
	join(strArray)
	plainPaste()
	processAdvParams(str, param := "")
	quoted(str)
	regPathJump(path)
	stripLine(string, replace := "")
	winMinimize()
	winTopToggle()
	winTransMinus(w := 0)
	winTransplus(w := 0)
	```
- 自定义动作
	+ 在 xfold.ini - [Cmds] 可自定义动作
	+ 可以通过此方式定义动作别名 如： echo=alert
	```js
	[Cmds]
	gi=https://www.google.com/search?q={%p}&tbm=isch
	gmap=https://maps.google.com/maps?q={%p}&um=1
	amap=https://ditu.amap.com/search?query={%p}
	gtd=finditByEverything("ext:md dm:>=202001 path:D:\Workspace|D:\2Assort {%p}",0)
	w3=http://w3.huawei.com/unisearch/contact.html?keyword={%p}
	welink=send({raw}{%p},300);send(^!d)
	cfg=edit(%A_ScriptDir%\xfold.ini)
	help=open(%A_ScriptDir%\readme@xfold.pdf)
	set=cfg
	xfold=xfoldCmd
	msg=welink
	echo=alert
	```
	```js
	; 使用
	LButton+i => gi
	LButton+i => gi({%x})
	```
	
	
- 动作参数
	+ open()
	+ open("C:\Windows")
- 变量支持
	+ 环境变量
		* 例： %appdata% %temp%
	+ AHK运行环境变量
		* 例： %A_ScriptDir% %clipboard%
	+ 配置文件变量
		* xfold.ini中[Setting]定义的配置项 **优先**
		* xfold.ini中[Setting-default]定义的配置项
		* 例： %Everything%  %eudic%
	+ 特殊变量
		* {%c} 剪贴板内容
			- 等同 %clipboard%
			- {c} 等同 {%c}
				```js
				LButton+g => open(https://www.google.com/search?q={%c})
				```
		* {%p} 用户输入
			- 弹出对话框让用户输入
			- {p} {%q} {q} 等同 {%p}
				```js
				LButton+g => open(https://www.google.com/search?q={%p})
				```
		* {%x} 发送Ctrl+C临时复制
			- 执行时发送Ctrl+C复制获取的文本内容
			- {x} 等同 {%x}
				```js
				LButton+g => open(https://www.google.com/search?q={%x})
				```
- 多个动作
	+ ; 分隔多个动作
		```js
		LButton+c c c c => send(^c);info(has been copied.)
		```
### 热字串扩展定义
- 在 xfold.ini-[Hotstings] 中定义 例 ::@@=leexioua@gmail.com 输入“@@”后再空格，替换为leexioua@gmail.com
- 参考AutoHotKey文档
	+ https://wyagd001.github.io/zh-cn/docs/lib/Hotstring.htm
	+ https://www.autohotkey.com/docs/v1/Hotstrings.htm
- 参考示例
	```js
	:o:@@=leexioua@gmail.com
	:o:telc=18612345678
	:o:telv=612345678
	:o:addr=Calle de xxxx, 28050 Madrid
	```
	

### 配置文件 @xfold.ini
- 用户存储配置项信息，修改后需要重新启动脚本才生效
- 主要用于保存相关工具、脚本、帮助等文件路径信息
- [Setting-default] 下定义默认缺省的配置项的值
- [Setting] 下定义用户配置项的值
	+ 获取参数时会 *优先* 获取 [Setting] 下对应配置项的值，如未找到，再查找获取 [Setting-default] 下对应配置项的值
- [Constants] 下定义常量，可被[Setting] [Setting-default] 引用
	```js
	[Constants]
	ProgramxFiles=D:\ProgramxFiles
	MyLinks=D:\Links
	home=%A_ScriptDir%

	[Settings-default]
	editor=notepad.exe
	Help_keymappings=%home%\leexioua-keys-default.ahk
	Link_notes=%A_ScriptDir%\#notes-list@ahk.md

	[Settings]
	editor=%ProgramxFiles%\SublimeText\sublime_text.exe
	```



### 实例及使用Tips
#### 实例：豆瓣电影搜索
1. 获取分析URL
	* https://search.douban.com/movie/subject_search?search_text=流浪地球2&cat=1002
2. 参数拼接替换
	* https://search.douban.com/movie/subject_search?search_text={%x}}&cat=1002
3. 生成动作 此示例使用open
	* open(https://search.douban.com/movie/subject_search?search_text={%x}}&cat=1002)
4. 定义快捷键映射
	* 快捷键映射配置文件中最后增加以下配置 （keys-default.txt 或 在xfold.ini-[Settings]-Help_keymappings 自定义的文件）
	* LButton+d d => open(https://search.douban.com/movie/subject_search?search_text={%x}}&cat=1002)
5. 重启应用生效
	* 可使用内置默认快捷键(需应用已打开) Ctrl+Alt+R

#### Tips
- 同一快捷键重复定义
```js
在 keys-default.txt 或 在xfold.ini-[Settings]-Help_keymappings 自定义的文件中如果出现多行定义了同一快捷键映射，以最后一行生效，即覆盖更新原则。
```

- 定义动作是否参数是否需要使用引号
```js
参数可以使用双引号或不加，以下两种方式写法均可
open(c:\windows\notepad.exe)
open("c:\windows\notepad.exe")

注：当前参数中英文分号 (;) 为保留关键字，在动作参数中使用可能引发问题，计划后续版本中将增加转义功能。
```


### 默认样例参考
- %A_ScriptDir%\keys-default.txt
	```js
	; 配置说明请参考 readme@xfold.pdf 
	; 变量常量配置参考配置文件 xfold.ini
	; 同一快捷键如果被定义多次，只使用最后一次定义，不会触发多个动作，即覆盖更新原则
	; 修改配置后，需要重启xfold生效

	; 默认重启快捷键为：Ctrl+Alt+R，可根据习惯修改为其它快捷键
	^!r => reload


	$F5 $F5 $F5 $F5 => {%p}

	LButton+3 => open(http://w3.huawei.com/unisearch/contact.html?keyword={%x})
	LButton+a => edit({%x})
	LButton+b => open(https://www.baidu.com/s?wd={%x})
	LButton+d => open(https://www.douban.com/search?q={%x})
	LButton+e => open(https://youdao.com/result?word={%x}&lang=en)
	LButton+g => open(https://www.google.com/search?q={%x})
	LButton+r => run({%x})
	LButton+s => saveNotes
	LButton+t => copyTitleTextLine
	LButton+v => preview({%x})
	LButton+w => send({raw}{%x},300);send(^!d)
	LButton+y => open(https://www.youtube.com/results?search_query={%x})
	LButton+z => open(https://www.zhihu.com/search?type=content&q={%x})
	LButton+, => open(https://youglish.com/pronounce/{%x}/english?)
	LButton+. => open(https://youglish.com/pronounce/{%x}/spanish?)

	LButton+f => findIt({%x})

	LButton+$F1 $F1 => open(%A_ScriptDir%\xfold-shortcuts-default.pdf)
	LButton+1 1 => edit(%A_ScriptDir%\keys-default.txt);edit(%A_ScriptDir%\keys-user.txt)
	LButton+e e => open(https://youglish.com/pronounce/{%x}/english?)
	LButton+t t => copyTitleText
	LButton+w w => open(http://w3.huawei.com/unisearch/contact.html?keyword={%x})


	LButton+t t t => copyWinTitle


	LButton+f f f f => finditByEverythingFullPath({%x})
	LButton+t t t t => title
	LButton+p p p p => process
	LButton+s s s s => edit(%Link_notes%);send(^{end},500)


	$F1 $F1 => toggleSwitchOn
	^+\ => toggleSwitchOn
	SwitchOn+e => open(https://youdao.com/result?word={%x}&lang=en)


	; 以下为其它扩展功能，如不需要，行首分号 (;) 注释即可

	LButton+^c => stripCopy
	LButton+$F12 => winTopToggle

	#= => winTransplus
	#- => winTransMinus
	^q ^q => send(!{F4})
	^+v => plainPaste

	holdonLBtnWhen("Space")
	LButton+Space => send({Enter})
	holdonLBtnWhen("LAlt")
	LButton+LAlt => send({Delete})
	holdonLBtnWhen("Tab")
	LButton+Tab => send(!{Tab})


	; explorer plugin
	!e@explorer.exe => edit
	LButton+^v@explorer.exe => explorer_clipboardSave2Txt
	; 文件对话框跳转到当前资源管理器活动的目录 Ctrl+Q 可根据需要修改 如Ctrl+D
	explorer_dialogueJump(~^q)
	```
- %A_ScriptDir%\keys-leexioua.txt
	```js
	; 个人使用快捷键配置，依赖相关工具软件 xfold.ini @leexioua
	; key for test
	; $F2 $F2 => clipboard({%x});safeActivate(%eudic%);send(^v,200)

	$F1 => {%p}
	$` => send(!r)
	^m => safeActivate(%eudic%)
	#!n => safeActivate(%Evernote%)
	~^!k => safeActivate(%keepass%,0)
	#` => restartAltRun
	#q => restartQuickLook

	^RButton => mouseinc_clipboardMenu

	$F10 $F10 => toggleSwitchOn

	; potplayer plugin
	XButton1 => send(^!+{Space})
	^XButton1 => send(^!+{PgDn})
	^XButton2 => send(^!+{PgUp})

	+XButton2 => send(^!+-)
	XButton2 => send(^!+=)

	; configback plugin
	#!F5 => configbak_Backup
	configbak_MonthlyBackup()

	$` $` => send(#!q)
	$^` $^` => ``send(#!q)
	^e ^e => eudicQuery({%x})

	$F1 $F1 => {%p}
	$F2 $F2 => open(D:\ProgramxFiles\BeyondCompare4\BCompare.exe)
	$F3 $F3 => open(%Cmd_EverythingCmds%)
	$F4 $F4 => redo
	$F6 $F6 => open(https://dida365.com/webapp/)
	$F7 $F7 => open(%Cmd_EvernoteCmds%)
	$F11 $F11 => adcTaskAdd
	$F12 $F12 => alertLastCmd

	$F1 $F1 $F1 => {%p}
	$F5 $F5 $F5 => toAltRun_xfoldCmd
	$F7 $F7 $F7 => toAltRun_evernoteTerms
	$F9 $F9 $F9 => toAltRun_mailCmd
	;$F2 $F2 $F2 => toAltRun_ahkCmd

	$F1 $F1 $F1 $F1 => send(#!{F1})
	$F2 $F2 $F2 $F2 => markdown_clipboardImageURI({%c})
	$F3 $F3 $F3 $F3 => send(#!{F3})
	$F4 $F4 $F4 $F4 => gtd
	$F7 $F7 $F7 $F7 => open(autohotkey.exe D:\Links\filelocator\locator-cmd.ahk {%p})
	$F9 $F9 $F9 $F9 => open(%Cmd_MailCmd% {%p})
	$F10 $F10 $F10 $F10 => getAccInfo
	$F12 $F12 $F12 $F12 => open(https://wyagd001.github.io/zh-cn/docs)

	LButton+^c => stripCopy

	LButton+c => collectNotes
	LButton+e => value(word,{%x});send({text}value(word),200);safeActivate(%eudic%)
	LButton+e => eudicQuery({%x})
	LButton+f => findIt({%x})
	LButton+h => open(https://www.hifini.com/search-{%x}.htm)
	LButton+i => gi({%x})
	LButton+m => gmap({%x})
	LButton+q => evernoteSearch
	LButton+x => locatorSearch({%x})
	LButton+y => open(https://www.youtube.com/results?search_query={%x})
	LButton+[ => escape4Cmd

	LButton+$F1 $F1 => open(%A_ScriptDir%\xfold-shortcuts-leexioua.pdf)
	LButton+$F4 $F4 => edit(D:\2Assort\#0笔记索引-宇宙起点.md)
	LButton+$F5 $F5 => edit(%A_ScriptDir%\xfold.ahk)
	LButton+2 2 => edit(%A_ScriptDir%\keys-leexioua.txt)
	LButton+3 3 => preview(D:\2Assort\cheatsheet\Capslock+.png)
	LButton+5 5 => edit(%A_ScriptDir%\xfold.ini)
	LButton+v v => open(https://forvo.com/search/{%x})

	LButton+$F10 $F10 $F10 $F10 => getAccAllText
	LButton+a a a a => viewAhkFile({%x})
	LButton+f f f f => finditByEverythingFullPath({%x})
	LButton+r r r r => run({%p})
	LButton+c c c c => edit(%WORKSPACE_HOME%\#notes-list.md);send(^{end},500)
	LButton+v v v v => send(^c);edit(%temp%\vholder-xfold.txt);send(^{end}{enter}^v, 500)

	/@SumatraPDF.exe => open(%Help_SumatraPDF%)

	^d@sublime_text.exe => send(^+k)
	^e@sublime_text.exe => send(^p)
	;!c !c@sublime_text.exe => mdCheckToggle ;疑似引起!c冲突
	LButton+1@sublime_text.exe => send(!c);preview({%c})
	LButton+8@sublime_text.exe => sublimetext_convertToUTF8
	LButton+m m@sublime_text.exe => sublimetext_markdownSyntax
	LButton+x x@sublime_text.exe => mdCheckToggle

	!Up@ADC.exe => adc_execute(Move Task Up)
	!Down@ADC.exe => adc_execute(Move Task Down)
	!Home@ADC.exe => adc_execute(Move Task Top)
	!End@ADC.exe => adc_execute(Move Task Bottom)
	!Left@ADC.exe => adc_execute(Move Task Top)
	!Right@ADC.exe => adc_execute(Move Task Bottom)

	!e@FileLocatorPro.exe => filelocator_editSelectedFile
	LButton+a@FileLocatorPro.exe => send(+!c);edit({%c})

	!c@WizTree64.exe => send(^!c)
	e@Koodo.exe => eudicQuery
	e@SumatraPDF.exe => eudicQuery

	Tab@eudic.exe => send(!{tab})
	-@eudic.exe => send(^!+-)
	=@eudic.exe => send(^!+=)
	\@eudic.exe => send(^!+\)
	RAlt@eudic.exe => send(^!+{Space})

	SwitchOn+e => eudicQuery
	;SwitchOn+a => edit({%x})
	;SwitchOn+b => open(https://www.baidu.com/s?wd={%x})
	;SwitchOn+d => open(https://www.douban.com/search?q={%x})
	;SwitchOn+g => open(https://www.google.com/search?q={%x})
	;SwitchOn+s => saveNotes
	;SwitchOn+z => open(https://www.zhihu.com/search?type=content&q={%x})
	;SwitchOn+, => open(https://youglish.com/pronounce/{%x}/english?)
	;SwitchOn+. => open(https://youglish.com/pronounce/{%x}/spanish?)
	;SwitchOn+f => findIt({%x})
	;SwitchOn+f@chrome.exe => findit


	; 切换查看视图 @explorer.exe
	LButton+1@explorer.exe => send(^!1)
	LButton+2@explorer.exe => send(^!2)
	LButton+3@explorer.exe => send(^!3)
	LButton+4@explorer.exe => send(^!4)
	LButton+5@explorer.exe => send(^!5)
	LButton+6@explorer.exe => send(^!6)
	LButton+7@explorer.exe => send(^!7)
	LButton+8@explorer.exe => send(^!8)
	holdonLBtnWhen(1@explorer.exe)
	holdonLBtnWhen(2@explorer.exe)
	holdonLBtnWhen(3@explorer.exe)
	holdonLBtnWhen(4@explorer.exe)
	holdonLBtnWhen(5@explorer.exe)
	holdonLBtnWhen(6@explorer.exe)
	holdonLBtnWhen(7@explorer.exe)
	holdonLBtnWhen(8@explorer.exe)

	; LButton+ESC ESC ESC ESC@sublime_text.exe => sublimetext_closeAll
	; $F4 $F4 $F4 $F4 => open(autohotkey.exe D:\Links\everything\everything-cmd.ahk ext:md dm:>=202001 path:D:\Workspace|D:\2Assort {%p})
	; SwitchOn+f => alert(f1)
	; SwitchOn+f f => alert(f2)
	; SwitchOn+f f f => alert(f3)
	; SwitchOn+f f f f => alert(f4)
	; SwitchOn+LButton+f => alert(lbtn+f1)
	; SwitchOn+LButton+f f => alert(lbtn+f2)
	; SwitchOn+LButton+f f f => alert(lbtn+f3)
	; SwitchOn+LButton+f f f f=> alert(lbtn+f4)
	```
	
# 更新日志
## 遗留优化 TODO
- Cmds友好使用界面 参考： AHK Command Picker
- 增加定义快捷键查找功能
- 代码走读 整理优化 增加打印日志，异常处理
- Send发送前进行检查等待窗口，如未找到窗口取消发送文本
- 当前发现已知问题，sublime text 中LButton+1预览功能发送!c 与!c !c快捷键定义冲突， 原因：SendLevel 发送的脚本定义的热键是否需要被激活
- 与CapsLocks+冲突问题，如 CapsLock+F1
- 打包后支持自定义脚本扩展功能
- plugin-adc plugin-excel 不同电脑 path/name 存在差异，需要检查修复
- {%x} redo 优化 是否需要再次复制，和预期是否一致？ 可以修改为 value(aValue,{%x});xxx(%aValue%) => 原因：%aValue%取值早于用户输入处理
- 解析热键定义中的保留字符使用 ; , 例： LButton+3 => copy;info("done;") 例： LButton+w => value(hwid, {%x});open(notepad);send(value(hwid), 1000) 当hwid中包含保留字符,时
- 增加组合键扩展 LButton+a e / Ctrl+k,Ctrl+d
- 增加代码注释自动生成文档 类似jsdoc AHKDoc
- 自动化测试/用例
- 迁移到Autohotkey2.0
- Github代码管理

## 20230511: 1.1.5
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
* 优化增加默认参数 \[Setting-default\] @leexioua-settings.ahk

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


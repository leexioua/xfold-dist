## 配置加载顺序
- 名称顺序： 按文件名称正序排序加载配置，配置文件(keys,settings)
	- 建议文件目录或文件名称前，增加字母数据编号。例如 u1, u2, user1, user2 等
- 覆盖模式： 如果有相同配置项，则后面的配置将覆盖前面已有的配置

## 文件命名规则
- xfold*.ini
- keys*.txt
```js
mixins\*\xfold*.ini
mixins\*\keys*.txt
```

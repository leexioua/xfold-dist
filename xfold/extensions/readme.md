## 配置加载顺序
- 名称顺序： 按文件名称正序排序加载配置，配置文件(keys,settings)
	- 建议文件目录或文件名称前，增加字母数据编号。例如 u1, u2, user1, user2 等
- 覆盖模式： 如果有相同配置项，则后面的配置将覆盖前面已有的配置

## 文件命名规则
- xfold*.ini
- keys*.txt
```js
extensions\*\xfold*.ini
extensions\*\keys*.txt
```

```js
xfold.ini

extensions\u1-leexioua\xfold-leexioua.ini
extensions\u2-huawei\xfold-huawei.ini
extensions\u3-gtdcmd\xfold-gtdcmd.ini
extensions\u4-pushitem\xfold-pushitem.ini
extensions\u5-spanishletter\xfold-spanishletter.ini
extensions\u9-lab\xfold-lab.ini
````

```js
keys.txt

extensions\u1-leexioua\keys-leexioua.txt
extensions\u2-huawei\keys-huawei.txt
extensions\u9-lab\keys-lab.txt
```


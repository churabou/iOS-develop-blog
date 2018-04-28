
## dequeueReusableCellとは？

swiftのセルを再利用するやつ。


cellが再利用されているのを確認する方法

``` .swift
func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell?
```

``` .swift
func dequeueReusableCell(withIdentifier identifier: String, 
                     for indexPath: IndexPath) -> UITableViewCell
```

上記のメソッドの違い
- 戻り値が非オプショナル。
-



## セルの再描画

- reload deta
- reload section
- reload cell


## UITableViewCell

- contentView
- backgroundView
- accesoryType


imageIView
textLabel

呼ばない限り描画されない？ので心配いらない。

### 標準の機能


- スワイプして削除
-

###　その他

- 伸び縮みするやつ

- 移動するやつ



### tableview as scrollView


### UIRefreshControll

引っ張って更新するやつ

カスタムプルダウン


- reachedBottomの判定

- React



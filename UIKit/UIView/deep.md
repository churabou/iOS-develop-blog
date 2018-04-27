
#  deep dive into views



UIView

- rectangleに描画する。
- UIResponderクラスを継承しておりタップやスワイプト行ったユーザーのアクションに対応できる
-


- viewはsubviewを持つ。 あるviewをremoveするとそのsubViewもremoveされ
 あるViewをisHiddenするとそのsubViewもisHiddenされる。
 
 
 
 uiview.window
 
 a view whose window property is nil cannot be visible to user
 
 
    label.window = nil
で消せるの？と思ったらget onlydatta.


- bounds

bounds.sizeを変更すると
中心は変わらない。

bounds.originを変更すると


- CGRect.insetBy(dx, dy)

``` .swift
override func viewDidLoad() {

let orange = UIView()
orange.frame = CGRect(x: 100, y: 100, width: 200, height: 400)
orange.backgroundColor = .orange
view.addSubview(orange)

let yellow = UIView()
yellow.frame = orange.bounds.insetBy(dx: 10, dy: 20)
yellow.backgroundColor = .yellow
orange.addSubview(yellow)

print(orange.bounds) //(0.0, 0.0, 200.0, 400.0)
print(orange.bounds.insetBy(dx: 10, dy: 20)) //(10.0, 20.0, 180.0, 360.0)
}

```


UIViewは一つのCALayerを持つ
viewはlayerのdelegate

view.backgroundColor = .red
view.layer.backgroundColor = UIColor.red.cgColor

view.frame change means change view.layer.frame


``` .swift

@objc private func tap() {
print("tap")
}

override func viewDidLoad() {

let orange = UIButton()
orange.layer.frame = CGRect(x: 100, y: 100, width: 200, height: 400)
orange.layer.backgroundColor = UIColor.orange.cgColor
orange.addTarget(self, action: #selector(tap), for: .touchUpInside)
view.addSubview(orange)
}
```

UIView

- frame
- bounds
- center
- transform





CALayer

- needsDisplayOnBoundsChange
 UIView.contentMode = .redraw
- setNeedDisplay


# UITableView

### 最小限のコード

``` .swift

class ViewController: UIViewController {
    
    fileprivate lazy var tableView: UITableView = {
        let t = UITableView()
        t.delegate = self
        t.dataSource = self
        t.frame = view.bounds
        t.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return t
    }()
    
    fileprivate var model: [String] {
        return (0..<20).map { "cell \($0)" }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tap \(indexPath)")
    }
}

extension ViewController: UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.row]
        return cell
    }
}
```


- cellについて(contentView)とか
- delegateメソッド
- life cycle
- クリックで伸びるアニメーションとか
- オートレイアウト
- Rxがらみ


# スケルトン

``` .swift

class CollectionViewCell: UICollectionViewCell {
    
    fileprivate lazy var label: UILabel = {
        let l = UILabel()
        l.textColor = .black
        l.backgroundColor = .gray
        l.textAlignment = .center
        l.bounds.size = CGSize(width: bounds.width, height: 30)
        l.center = contentView.center
        return l
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        contentView.addSubview(label)
    }
    
    func update(text: String) {
        label.text = text
    }
}

class ViewController: UIViewController {
    
    private lazy var layout: UICollectionViewFlowLayout = {
       let l = UICollectionViewFlowLayout()
        let m: CGFloat = 3
        l.minimumInteritemSpacing = m
        l.minimumLineSpacing = m
        let size = (view.bounds.width / 4) - (5 * m) / 4
        l.itemSize = CGSize(width: size, height: size)
        l.scrollDirection = .vertical
        l.sectionInset = UIEdgeInsets(top: m, left: m, bottom: m, right: m)
        return l
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {
        let v = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        v.backgroundColor = .red
        v.delegate = self
        v.dataSource = self
        v.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return v
    }()

    
    fileprivate var model: [String] {
        return (0..<36).map { "cell \($0)"}
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
}


extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tapped \(indexPath)")
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return model.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.update(text: model[indexPath.row])
        return cell
    }
}

```

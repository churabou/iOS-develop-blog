class ViewController: UIViewController {
    
    let bag = DisposeBag()
    let viewModel = ViewModel()
    
    private var button = UIButton()
    private var label = UILabel()
    
    func setUpSubviews() {
        
        label.bounds.size = CGSize(width: 100, height: 100)
        label.center = view.center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        view.addSubview(label)

        button.bounds = view.bounds
        view.addSubview(button)
    }
    
    override func viewDidLoad() {
        setUpSubviews()
        configure()
    }
    
    func configure() {
        //countが変更されるたびにラベルのテキストを変更する。
        
        viewModel.count$
            .map { "count: \($0)" }
            .bind(to: label.rx.text)
            .disposed(by: bag)
        
        
        // map オペレーターでIntのストリームをUIColorのストリームに変換した(多分)
        // bindToはRxCocoaでObservableTypeに拡張されたもの。
        // ObserverTypeを引数にもち ObservableType.E == ObserverType.E
        //
        // ====
        //  public func bind<O>(to observer: O) -> Disposable where O : ObserverType, O.E == Self.E?
        // ===
        //
        // 今回viewのbackgroundColorを変更するObserverを作って見たのでbindしてみる。
        
        viewModel.count$
            .map { $0 % 3 == 0 ? UIColor.red : UIColor.black }
            .bind(to: changeBackground)
            .disposed(by: bag)
        
        
        // subscriveじゃなくてasDriver()にすると、errorが出ない、mainスレッドで通知がきてUI向けなどメリットがあるらしい。
        // [weak self] とかしたほうがいいのかな？
        button.rx.tap.asDriver().drive(onNext: {
            self.viewModel.increase()
        }).disposed(by: bag)
    }
    
    //とりあえずBinderを使えばUIの変更をObserverにできて、Obserbleとbindできる
    var changeBackground: AnyObserver<UIColor> {
        return Binder(self) { me , color in
            me.view.backgroundColor = color
        }.asObserver()
    }
}

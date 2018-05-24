class ViewModel {
    
    var count$: Observable<Int> {
        return count.asObservable()
    }

    private var count: BehaviorRelay<Int> = BehaviorRelay(value: 0)

    // 以前はVariableを使用していたがSwift4でdeprecatedされた。
    // count.value { get }
    // count.accept() { set }
    //という感じだろうか。
    
    func increase() {

//        BehaviorSubjectをラップしたもので値の変更と同時にイベントが発火する。
//
//        public func accept(_ event: Element) {
//            _subject.onNext(event)
//        }
//
        count.accept(count.value+1)
    }
}

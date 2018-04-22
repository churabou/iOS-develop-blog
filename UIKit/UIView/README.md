### aaa


###  draw(_:)

デフォルトでは何もしないのでsuper.draw()を呼ぶ必要はない。
 
 > If you subclass UIView directly, your implementation of this method does not need to call super. However, if you are subclassing a different view class, you should call super at some point in your implementation.

UIViewを直接継承した場合はsuperは呼ばなくて良いが
UILabel等を継承した場合はsuperを呼ぶ必要がある。

This method is called when a view is first displayed or when an event occurs that invalidates a visible part of the view. You should never call this method directly yourself. To invalidate part of your view, and thus cause that portion to be redrawn, call the setNeedsDisplay() or setNeedsDisplay(_:) method instead.

 このメソッドを直接呼ぶことはなく、

# Queue(큐) 2021.04.18 - 수정

큐 == Queue

"큐" 는 줄이라고 생각하면 됩니다. 

Q. "Queue" 를 왜 배워야하나요?

A. 배우는 이유는 다양하겠지만 그 특성때문에 사용한다고 볼 수 있습니다.

큐 의 특성 중 가장 중요한 것은 "FIFO"(First-In-First-Out) 입니다. 요식업계에서 주로 사용하는 용어인 "선입선출" 과 동일한 의미죠.

이 특성을 활용한 데이터구조를 작성할 필요가 있을 때 큐를 사용해야하므로 배워야 하는 것 같습니다.

예시로는 iOS 프로그래밍 개념 중 "GCD" 가 있는데 거기서 스레드 제어 메소드로 다음과 같은 메소드가 있습니다.

```swift
DispatchQueue.main.async { ... }
```

이 메소드가 Queue가 사용되었다고 볼 수 있겠죠? 

이 외에도 멀티스레드 관련해서 무언가 해야한다면 이 개념이 필요할 수도 있을 겁니다.

### Queue의 기능

---

- enquene() : "큐 안에 넣는다." == 새로운 요소를 맨 뒤에 추가한다.
- dequeue() : "큐를 제거한다." == 첫 번째 요소를 제거한 뒤 반환한다.
- peek() : "첫 번째 요소를 끄집어 낸다." == 데이터에 영향을 주지 않고 확인한다.
- clear() : "요소들을 제거한다."
- count(), isEmpty, isFull, capacity, insert, removeAtIndex 등이 있습니다.

### 구현방법

---

먼저 Queue의 구조입니다.

```swift
import Foundation

public struct Queue<T> {
    private var data = [T]()
    // 빈 큐 구조를 정의한다.
    public init() { }
    
    /// 큐에서 첫 번째 요소를 제거하고 반환
    /// - 반환값:
    /// - 큐가 빈 상태가 아닌경우, 첫 번째 요소의 타입은  `T`
    /// - 큐가 빈 상태인 경우, `nil`을 반환
    public mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    /// 큐에서 첫 번째 요소를 제거하지 않고 반환
    /// - 반환값:
    /// - 큐가 빈 상태가 아닌 경우, 첫 번째 요소의 타입은 `T`
    /// - 큐가 빈 상태인 경우, `nil` 을 반환
    public func peek() -> T? {
        return data.first
    }
    
    /// 큐의 맨 뒤에 요소를 추가
    /// - 복잡성: O(1)
    /// - 파라미터 요소: `T` 타입의 요소
    public mutating func enqueue(element: T) {
        data.append(element)
    }
    
    /// MARK: - 순환 버퍼를 위한 도우미 메소드 구현
    /// 버퍼를 재설정해 빈 상태가 되게함
    public mutating func clear() {
        data.removeAll()
    }
    
    /// 큐에 있는 요소의 수를 반환
    /// `count`는 큐에 있는 요소의 수
    public var count: Int {
        return data.count
    }
    
    /// 큐의 용량을 반환
    public var capacity: Int {
        get {
            return data.capacity
        }
        set {
            data.reserveCapacity(newValue)
        }
    }
    
    /// 큐가 꽉 찼는지 확인
    /// - 반환값: 큐가 꽉 찬 경우 `True`를 반환하고, 그렇지 않은 경우 `False`를 반환
    public func isFull() -> Bool {
        return count == data.capacity
    }
    
    /// Check if the queue is empty. 큐가 비어있는지를 확인
    /// - 반환값: 큐가 비어있는 경우 `True`를 반환하고, 그렇지 않은 경우 `False`를 반환
    public func isEmpty() -> Bool {
        return data.isEmpty
    }
}
```

큐의 실행코드입니다.

```swift
var queue = Queue<Int>()

queue.enqueue(element: 100)
queue.enqueue(element: 120)
queue.enqueue(element: 125)
queue.enqueue(element: 130)

let x = queue.dequeue()
print(x)
let y = queue.peek()
print(y)
let z = queue.dequeue()
print(z)

```




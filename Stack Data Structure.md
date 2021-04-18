# Stack Data Structure

Stack에 대한 단간한 예시는 다음과 같습니다.

- 팬케이크
- 책
- 종이
- 지폐

위 예시들의 특징은 오브젝트를 하나씩 쌓을 때마다 맨 위에 추가된다는 점이죠.

### Stack operations

------

스텍을 활용하는 이유 중 하나는 데이터 접근에 대한 방식을 통제하기 위함입니다. 스텍의 특성인 데이터 저장방식을 구현하고 싶기 때문이죠. 

스텍은 LIFO(last-in-first-out) 의 특성을 가지고 있습니다. iOS 개발할 때, UIViewController에서 present해보셨다면, 그 구조라고 생각하셔도 됩니다.

스텍의 중요한 오퍼레이션은 2 가지가 있습니다.

1. push : 요소를 맨 위에 추가한다.
2. pop : 맨 위에 있는 요소를 제거한다.

iOS 개발에서 UINavigationController에서 제공하는 2 가지 메소드인 .pushController 와 .popController 가 이에 해당한다고 볼 수 있죠.

책에서 드는 예시가 좋아서 추가합니다.

- (제가 말했던 것) navigation stack에서 활용하고 있습니다.
- 메모리 할당에서도 구조적인 단위에서 스텍을 활용하고 있습니다. 지역변수의 메모리는 스텍에 의해서 관리됩니다.
- "Search and conquer" 알고리즘에서도 스텍을 활용합니다.

### Implementaion

---

```swift
// 스텍의 기본 구조
public struct Stack<Element> {
    private var storage: [Element] = []
    public init() { }
}

// 스텍 호출을 도와주는 extension
extension Stack: CustomStringConvertible {
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)"}.reversed().joined(separator: "\n"))
        -----------
        """
    }
}
```

Q. "CustomStringConvertible" 이 무엇인가요?

A. 결론먼저 말씀드리면, String 호출을 편리하게 해주는 것입니다.

1. 배열을 .map{ $0 } 접근을 통해 각각의 요소에 접근합니다.
2. .map으로 각 요소에 접근했다면 .reserved() 를 통해 순서를 역순으로 변경합니다.
3. .joined(separator:)를 통해서 array로 구성되었던 요소들을 하나의 String으로 변경하고 각각의 요소 끝에 \n를 추가합니다.

### Push and pop operations

---

```swift
example(of: "using a stack") { // raywenderlich에서 만들어 둔 커스텀메소드
 	var stack = Stack<Int>()
  // 각 stack에 element를 추가하라.
 	stack.push(1)
  stack.push(2)
  stack.push(3)
  stack.push(4)
  
  print(stack)
  
  // stack.pop()   한 결과가 만약 4라면 print문을 호출하라.
  if let poppedElement = stack.pop() {
    assert( 4 == poppedElement )
    print("Popped: \(poppedElement)")
  }
}
```

example 메소드는 "raywenderlich" 기본 프로젝트에서 제공하는 메소드입니다. 호출을 예쁘게 할 수 있도록 도와주죠. 그리고 assert 같은 경우 test할 때 주로 사용하는 메소드입니다. assert 내부에 조건문(condition)이 부합한다면, print 문을 호출하는 구조입니다.

지금까지 push와 pop 은 essential operations 입니다. 다음은 non-essential operations 에 대해 알아보겠습니다.

### Non-essential operations

---

Non-essential operations 는 peek 와 isEmpty 입니다.

```swift
public func peek() -> Element? {
  storage.last
}

public var isEmpty: Bool {
  peek() == nil
}
```

"peek" 는 스텍 중 제일 위에 있는 값을 확인하는 메소드로 스텍의 데이터를 없애는 용도가 아닌 순전히 데이터 조회 용도입니다.

"isEmpty" 는 스텍에 요소가 비어있는지 확인하는 메소드입니다. 역시 데이터 조회의 용도로 사용됩니다.

### Less is more

---

책에서는 다음과 같이 질문하고 있습니다. 

> 너가 "Collection Protocol"을 스텍에 부여하고 싶을 수도 있다. 스텍의 목적은 데이터에 접근할 수 있는 수를 제한하는 것이 목표인 데이터 구조이다. 그리고 "Collection Protocol" 을 채택한다는 것의 목표는 모든 데이터에 접근할 수 있으며 반복자와 서브스크립트를 가능하게 해주는데 목적이 있다. 둘이 정반대의 목적을 가지므로 이 경우의 대답은 "Less is more " 이라고 할 수 있겠다.

상당히 명쾌한 설명입니다. 기능적으로 구현은 가능하지만 그렇게 하게된다면, 존재 목적은 사라지는 것이죠.

그렇지만 구현해보는 것은 공부가 되므로 구현에 대해서 설명합니다.

기존의 코드)

```swift
// 스텍의 기본 구조
public struct Stack<Element> {
    private var storage: [Element] = []
    public init() { }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
      storage.last
    }

    public var isEmpty: Bool {
      peek() == nil
    }
}

// 스텍 호출을 도와주는 extension
extension Stack: CustomStringConvertible {
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)"}.reversed().joined(separator: "\n"))
        -----------
        """
    }
}

example(of: "using a stack") { 
    var stack = Stack<Int>()
    stack.push(1)
    stack.push(2)
    stack.push(3)
    stack.push(4)
    
    print(stack)
    
    if let poppedElement = stack.pop() {
        assert(4 == poppedElement)
        print("Popped: \(poppedElement)")
    }
}


```



추가된 기능 : collection 프로토콜 채택

기능이 추가된 코드)

```swift
// 스텍의 기본 구조
public struct Stack<Element> {
    private var storage: [Element] = []
    
    public init(_ elements: [Element]) { 
        storage = elements
    }
    
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    public func peek() -> Element? {
        storage.last
    }
    
    public var isEmpty: Bool {
        peek() == nil
    }
}

// 스텍 호출을 도와주는 extension
extension Stack: CustomStringConvertible {
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)"}.reversed().joined(separator: "\n"))
        -----------
        """
    }
}

extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
    
    
}

example(of: "initializing a stack from an array") { 
    let array = ["A", "B", "C", "D"]
    var stack = Stack(array)
    print(stack)
    stack.pop()
}

example(of: "initializing a stack from an array literal") { 
    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
    print(stack)
    stack.pop()
}
```
















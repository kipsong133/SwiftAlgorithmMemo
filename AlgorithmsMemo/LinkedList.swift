/* 
 * Linked List
 * https://www.raywenderlich.com/books/data-structures-algorithms-in-swift/v3.0/chapters/6-linked-list
 */

/*
 * 연결리스트란 == A linked list is a collection of values arranged in a linear unidirectional sequence.
 * -> 연결 리스트는 컬렉션인데 값이 선형적으로 양방향 선형 시퀀스로 배열된 컬렉션을 의미합니다.
 * 이게 무슨말이냐면, 방향성이 있으면서 순서가 있는데 Collection 프로토콜을 준수한다. 라고 오역하고 넘어갑니다.
 */

/// Node의 구조(클래스로 선언했다는 점에 주목)
public class Node<Value> {
    /// 자신의 노드에 대한 정보를 저장할 프로퍼티
    public var value: Value
    /// 다음 노드에 대한 정보를 저장할 프로퍼티
    public var next: Node?
    
    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

// "CustomStringConvertible" 프로토콜 채택
extension Node: CustomStringConvertible {
    
    public var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next)
    }
}


/* 연결리스트(Linked List) */

/// 연결리스트(Linked List)
public struct LinkedList<Value> {
    /// 앞에 노드를 저장할 프로퍼티
    public var head: Node<Value>?
    /// 뒤에 노드를 저장할 프로퍼티
    public var tail: Node<Value>?
    
    /// 기본 초기화 메소드
    public init() { }
    
    /// 값의 존재여부를 확인하는 연산프로퍼티
    public var isEmpty: Bool {
        head == nil
    }
    
    /// 연결리스트의 push 메소드
    public mutating func push(_ value: Value) {
        // head 노드에 입력받은 인자를 모두 할당한다.
        head = Node(value: value, next: head)
        /// tail이 값에 따른 로직
        /// - tail이 nil인 경우, tail에 head Node를 할당한다.
        /// - tail이 있는 경우, 아무 로직도 수행하지 않는다.
        if tail == nil {
            tail = head
        }
    }
    
    /// 연결리스트의 append 메소드
    public mutating func append(_ value: Value) {
        // 1 값이 있는경우 통과, 없다면 push메소드 호출한다.
        guard !isEmpty else {
            push(value)
            return
        }
        
        // 2 tail의 프로퍼티중 next에 추가할 값을 넣는다.
        tail!.next = Node(value: value)
        
        // 3 방금 추가한 노드 전체를 tail로 업데이트한다.
        tail = tail!.next
    }
    
    /// 연결리스트 보조 메소드
    public func node(at index: Int) -> Node<Value>? {
        // 1
        var currentNode = head
        var currentIndex = 0
        
        // 2
        /// head 값은 있음 + 입력받은 인덱스가 더 큰 경우
        /// - while문은 head -> 내가 원하는 인덱스 까지 계속 순회하게 된다.
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
    
    /// 연결리스트의 insert 메소드
    @discardableResult
    public mutating func insert(_ value: Value,
                                after node: Node<Value>)
                                -> Node<Value> {
        /// tail에 값이
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    
}

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

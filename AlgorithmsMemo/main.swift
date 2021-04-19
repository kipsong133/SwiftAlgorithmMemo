/* Linked List 실행코드 */

// 가장 기본이 되는 Node 구조에 대한 실행코드
example(of: "creating and linking nodes") { 
    // 각각의 노드를 생성한다.
    let node1 = Node(value: 1)
    let node2 = Node(value: 2)
    let node3 = Node(value: 3)
    
    // 노드에 다음 노드를 할당한다.
    node1.next = node2
    node2.next = node3
    
    print(node1)   
}

/// 연결리스트 실행코드
example(of: "push") { 
    var list = LinkedList<Int>()
    
    list.push(3)
    list.push(2)
    list.push(1)
    
    print(list)
}

/// 연결리스트 append 실행코드
example(of: "append") { 
    var list = LinkedList<Int>()
    
    list.append(1)
    list.append(2)
    list.append(3)
    
    print(list)
}

/// 연결리스트 insert 실행코드
example(of: "inserting at a particular index") { 
    /// 연결리스트 인스턴스 생성
    var list = LinkedList<Int>()
    // list에 value를 푸쉬한다.
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before inserting: \(list)")
    var middleNode = list.node(at: 1)!
    for _ in 1...4 {
        middleNode = list.insert(-1, after: middleNode)
    }
    print("After inserting: \(list)")
}

/// 연결리스트 pop 실행코드
example(of: "pop") { 
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before poping list: \(list)")
    let poppedValue = list.pop()
    print("After popping list: \(list)")
    print("Popped value: " + String(describing: poppedValue))
}

/// 연결리스트 removeLast 실행코드
example(of: "removing the last node") { 
    var list = LinkedList<Int>()
    list.push(3)
    list.push(2)
    list.push(1)
    
    print("Before removing last node: \(list)")
    let removedValue = list.removeLast()
    
    print("After removing last node: \(list)")
    print("Removed value: " + String(describing: removedValue))
}

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

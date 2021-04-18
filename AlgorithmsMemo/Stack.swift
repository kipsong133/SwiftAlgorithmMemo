/*
 * Stack Data Structure
 * raywenderlich 책 내용을 정리했습니다.
 */


// Implementaion

public struct Stack<Element> {
    
    /// 스텍의 요소를 저장할 array
    private var storage: [Element] = []
    
    /// 기본 초기화 메소드
    public init() { }
    
    /// array를 입력받기 위한 초기화 메소드
    public init(_ elements: [Element]) {
        storage = elements
    }
    
    /* 필수 메소드 */
    /// array에 제일 마지막에 추가해주는 메소드
    public mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    /// array에 제일 마지막에 있는 요소를 추출하는 메소드
    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }
    
    /* 비필수 메소드 */
    /// 스텍의 제일 마지막 값을 출력하는 메소드 (단, 값을 제거하진 않음.)
    public func peek() -> Element? {
        storage.last
    }
    
    /// 스텍의 요소가 있는지 확인하는 메소드
    public var isEmpty: Bool {
        peek() == nil
    }
    
    
}

// "CustomStringConvertible" 프로토콜을 통해서 호출된 값을 일정한 형태호 호출하기 편하도록 해줍니다.
extension Stack: CustomStringConvertible {
    // map 메소드는 array의 요소에 연산을 적용하게 해주는 메소드입니다.
    // reversed 메소드는 요소의 순서를 역으로 변경 해주는 메소드입니다.
    // joined 메소드는 각각의 String 요소들을 하나의 String으로 변경해줍니다. separator를 통해서 요소들의 끝을 해당 파라미터로 해줍니다.
    public var description: String {
        """
        ----top----
        \(storage.map { "\($0)" }.reversed().joined(separator: "\n"))
        -----------
        """
    }
}

// "ExpressibleByArrayLiteral" 프로토콜을 채택함에 따라서 arrayLiteral을 입력 받을 수 있게 된다.
extension Stack: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: Element...) {
        storage = elements
    }
}


//// Implementation 과 Challenge 실행코드
///// 기본 예제
///// - push를 통해 array의 제일 마지막에 추가한다.
///// - pop을 통해 array의 제일 마지막 값을 추출한다.
//example(of: "using a stack") { 
//    // 스텍 인스턴스를 생성한다.
//    var stack = Stack<Int>()
//    // 스텍에 push한다.
//    stack.push(1)
//    stack.push(2)
//    stack.push(3)
//    stack.push(4)
//    
//    print(stack)
//    
//    if let poppedElement = stack.pop() {
//        // assert 메소드는 () 내부에 작성된 조건을 만족했을 시, print문을 호출한다.
//        assert(4 == poppedElement)
//        print("Popped: \(poppedElement)")
//    }
//}
//
//
///// array를 파라미터로 초기화 예제
///// - 기존에는 Element 하나씩 추가했다.
///// - 이번에는 Array로 한번에 추가하는 예제이다.
//example(of: "initializing a stack from an array") {
//  let array = ["A", "B", "C", "D"]
//  var stack = Stack(array)
//  print(stack)
//  stack.pop()
//}
//
///// "ArrayLiteral"로 입력받는 예제
///// - array의 요소를 한 번에 입력받아 초기화하는 예제이다.
//example(of: "intializing a stack from an array literal") { 
//    var stack: Stack = [1.0, 2.0, 3.0, 4.0]
//    print(stack)
//    stack.pop()
//}
//
///* 첫 번째 문제
// * 배열을 역순으로 정렬하라.
// */
//
//func printInReverse<T>(_ array: [T]) {
//    // 스텍을 생성한다.
//    var stack = Stack<T>()
//    
//    // 스텍에 push한다.
//    for value in array {
//        stack.push(value)
//    }
//    
//    // 스텍에 값을 pop한다.
//    while let value = stack.pop() {
//        print(value)
//    }
//    
//}
//
//example(of: "Challenge 1") {
//    let array = [1, 2, 3, 4]
//    printInReverse(array)
//}
//
///* 두 번째 문제
// * (와 )의 세트가 맞는지 확인해라.
// */
//
//func checkParentheses(_ string: String) -> Bool {
//    var stack = Stack<Character>()
//    
//    for character in string {
//        if character == "(" {
//            stack.push(character)
//        } else if character == ")" {
//            if stack.isEmpty {
//                return false
//            } else {
//                stack.pop()
//            }
//        }
//    }
//    return stack.isEmpty
//}
//

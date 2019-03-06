class Node<T: Equatable & Comparable> {
    var element: T
    
    var leftChild: Node? = nil
    var rightChild: Node? = nil
    
    init(element: T) {
        self.element = element
    }
    
    func insert(_ node: Node<T>) {
        if node < self {
            if let leftChild = leftChild {
                leftChild.insert(node)
            } else {
                leftChild = node
            }
        } else {
            if let rightChild = rightChild {
                rightChild.insert(node)
            } else {
                rightChild = node
            }
        }
    }
    
    func delete(_ node: T) {
        
    }
    
    func search(_ element: T) {
        
    }
}

// Traversal
extension Node {
    func inOrderDepthFirstTraversal() {
        leftChild?.inOrderDepthFirstTraversal()
        print(element)
        rightChild?.inOrderDepthFirstTraversal()
    }
    
    func preOrderDepthFirstTraversal() {
        print(element)
        leftChild?.preOrderDepthFirstTraversal()
        rightChild?.preOrderDepthFirstTraversal()
    }
    
    func postOrderDepthFirstTraversal() {
        leftChild?.postOrderDepthFirstTraversal()
        rightChild?.postOrderDepthFirstTraversal()
        print(element)
    }
}

extension Node: Equatable, Comparable {
    static func < (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.element < rhs.element
    }
    
    static func > (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.element > rhs.element
    }
    
    static func <= (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.element <= rhs.element
    }
    
    static func >= (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.element >= rhs.element
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.element == rhs.element
    }
}

extension Node: CustomDebugStringConvertible {
    var debugDescription: String {
        let desc = """
        element is \(element)
        left: \(String(describing: self.leftChild))
        right: \(String(describing: self.rightChild))
        """
        return desc
    }
}

let avlTree = Node(element: 5)

avlTree.insert(Node(element: 2))
avlTree.insert(Node(element: 10))
avlTree.insert(Node(element: 8))
avlTree.insert(Node(element: 1))
avlTree.insert(Node(element: 4))

avlTree.inOrderDepthFirstTraversal()
print("--------------------")
avlTree.preOrderDepthFirstTraversal()
print("--------------------")
avlTree.postOrderDepthFirstTraversal()
print("--------------------")






/**
 
 Binary Tree Data Structure
 Author: Keith Chan, 4 Mar 2019
 
 */

public class BinaryTree<T: Comparable> {
    public var key: T? = nil
    var left: BinaryTree? = nil
    var right: BinaryTree? = nil
    
    public func minimum() -> BinaryTree<T> {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    public func maximum() -> BinaryTree<T> {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    public func search(_ target: T) -> T? {
        
        guard let key = key else {
            return nil
        }
        
        if target == key {
            return key
        } else if target < key {
            return left?.search(target)
        } else {
            return right?.search(target)
        }
    }
    
    public func insert(_ newKey: T) {
        
        guard let key = key else {
            self.key = newKey
            return
        }
        
        if newKey < key {
            if let left = left {
                left.insert(newKey)
            } else {
                left = BinaryTree()
                left?.key = newKey
            }
        } else {
            if let right = right {
                right.insert(newKey)
            } else {
                right = BinaryTree()
                right?.key = newKey
            }
        }
    }
    
    public func delete(_ target: T) {
        if let newNode = remove(target) {
            self.key = newNode.key
            self.left = newNode.left
            self.right = newNode.right
        }
    }
    
    private func remove(_ target: T) -> BinaryTree<T>? {
        guard let key = key else {
            return nil
        }
        
        if key > target {
            left = left?.remove(target)
            return self
        } else if key < target {
            right = right?.remove(target)
            return self
        } else {
            guard let _ = right else {
                return left
            }
            
            guard let _ = left else {
                return right
            }
            
            let node = self.left?.maximum()
            node?.left = self.left?.removeMax()
            node?.right = self.right
            return node
        }
    }
    
    private func removeMax() -> BinaryTree<T>? {
        guard let _ = right else {
            return left
        }
        
        self.right = self.right?.removeMax()
        return self
    }
}

// Traversal
extension BinaryTree {
    func inOrderDepthFirstTraversal() {
        left?.inOrderDepthFirstTraversal()
        print("\(String(describing: self.key))")
        right?.inOrderDepthFirstTraversal()
    }
    
    func preOrderDepthFirstTraversal() {
        print("\(String(describing: self.key))")
        left?.preOrderDepthFirstTraversal()
        right?.preOrderDepthFirstTraversal()
    }
    
    func postOrderDepthFirstTraversal() {
        left?.postOrderDepthFirstTraversal()
        right?.postOrderDepthFirstTraversal()
        print("\(String(describing: self.key))")
    }
}

let tree = BinaryTree<Int>()
tree.insert(5)
tree.insert(2)
tree.insert(10)
tree.insert(-1)
tree.insert(4)
tree.insert(7)
tree.insert(6)
tree.insert(9)
tree.insert(8)
tree.insert(20)

tree.delete(5)

tree.preOrderDepthFirstTraversal()

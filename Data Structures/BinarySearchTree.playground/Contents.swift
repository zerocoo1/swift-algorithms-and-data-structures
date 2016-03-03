// Andrey Vysher 2016
// Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

// Binary Tree

class TreeNode<T: Comparable> {
    
    var data: T
    var leftChield: TreeNode<T>?
    var rightChield: TreeNode<T>?
    
    init(data: T) {
        self.data = data
    }
    
    func find(data: T) -> TreeNode<T>? {
        if self.data == data {
            return self
        }
        
        if data > self.data && rightChield != nil {
            return rightChield?.find(data)
        }
        
        if leftChield != nil {
            return leftChield?.find(data)
        }
        
        return nil
    }
    
    func insert(data: T) {
        if data == self.data {
            return
        }
        
        if data > self.data {
            if rightChield != nil {
                rightChield?.insert(data)
            } else {
                rightChield = TreeNode<T>(data: data)
            }
        } else {
            if leftChield != nil {
                leftChield?.insert(data)
            } else {
                leftChield = TreeNode<T>(data: data)
            }
        }
    }
}

class BinarySearchTree<T: Comparable> {
    
    var root: TreeNode<T>?
    
    func insert(data: T) {
        if root == nil {
            root = TreeNode<T>(data: data)
        } else {
            root?.insert(data)
        }
    }
    
    func find(data: T) -> TreeNode<T>? {
        
        if root != nil
        {
            return root?.find(data)
        }
        
        return nil
    }
    
    func delete(data: T) {
        var curNode = root
        var parentNode = root
        var isLeftChild = false
        
        if curNode == nil {
            return
        }
        
        while curNode != nil && curNode?.data != data {
            parentNode = curNode
            
            if data < curNode?.data {
                curNode = curNode?.leftChield
                isLeftChild = true
            } else {
                curNode = curNode?.rightChield
                isLeftChild = false
            }
        }
        
        if curNode == nil {
            return
        }
        
        if curNode?.leftChield == nil && curNode?.rightChield == nil {
            if curNode?.data == root?.data {
                root = nil
            } else {
                if isLeftChild {
                    parentNode?.leftChield = nil
                } else {
                    parentNode?.rightChield = nil
                }
            }
        } else if curNode?.rightChield == nil {
            if curNode?.data == root?.data {
                root = root?.leftChield
            } else if isLeftChild {
                parentNode?.leftChield = curNode?.leftChield
            } else {
                parentNode?.rightChield = curNode?.leftChield
            }
        } else if curNode?.leftChield == nil {
            if curNode?.data == root?.data {
                root = root?.rightChield
            } else if isLeftChild {
                parentNode?.leftChield = curNode?.rightChield
            } else {
                parentNode?.rightChield = curNode?.rightChield
            }
        }
        
        // for node with two childs
        
        if curNode?.leftChield != nil && curNode?.rightChield != nil {
            var successorParentNode = curNode
            var successorNode = curNode?.rightChield
            
            if successorNode?.leftChield == nil {
                successorNode?.leftChield = curNode?.leftChield
                
            } else {
                
                while successorNode?.leftChield != nil && successorNode?.rightChield != nil {
                    successorParentNode = successorNode
                    successorNode = successorNode?.leftChield
                }
                
                successorNode?.rightChield = curNode?.rightChield
                successorNode?.leftChield = curNode?.leftChield
                successorParentNode?.leftChield = nil
            }
            
            if isLeftChild {
                parentNode?.leftChield = successorNode
            } else {
                parentNode?.rightChield = successorNode
            }
        }
    }
    
    func printOut(node: TreeNode<T>) {
        print("======\n|data: \(node.data)|\n|left: \(node.leftChield?.data) right: \(node.rightChield?.data)|")
        if node.leftChield != nil {
            printOut(node.leftChield!)
        }
        if node.rightChield != nil {
            printOut(node.rightChield!)
        }
        
    }
}

///////////////
// TEST AREA //
///////////////

let bTree = BinarySearchTree<Int>()

bTree.insert(52)
bTree.insert(48)
bTree.insert(56)
bTree.insert(32)
bTree.insert(50)
bTree.insert(54)
bTree.insert(78)
bTree.insert(20)
bTree.insert(36)
bTree.insert(72)
bTree.insert(90)
bTree.insert(5)
bTree.insert(70)
bTree.insert(88)
bTree.insert(102)

bTree.delete(78)
bTree.delete(90)

bTree.printOut(bTree.root!)

print(bTree.find(78))












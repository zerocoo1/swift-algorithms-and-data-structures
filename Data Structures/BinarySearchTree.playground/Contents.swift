// Andrey Vysher 2016
// Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

// Binary Search Tree

class TreeNode<T: Comparable> {
    
    var data: T
    var leftChild: TreeNode<T>?
    var rightChild: TreeNode<T>?
    
    init(data: T) {
        self.data = data
    }
    
    func find(data: T) -> TreeNode<T>? {
        if self.data == data {
            return self
        }
        
        if data > self.data && rightChild != nil {
            return rightChild?.find(data)
        }
        
        if leftChild != nil {
            return leftChild?.find(data)
        }
        
        return nil
    }
    
    func insert(data: T) {
        if data == self.data {
            return
        }
        
        if data > self.data {
            if rightChild != nil {
                rightChild?.insert(data)
            } else {
                rightChild = TreeNode<T>(data: data)
            }
        } else {
            if leftChild != nil {
                leftChild?.insert(data)
            } else {
                leftChild = TreeNode<T>(data: data)
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
                curNode = curNode?.leftChild
                isLeftChild = true
            } else {
                curNode = curNode?.rightChild
                isLeftChild = false
            }
        }
        
        if curNode == nil {
            return
        }
        
        if curNode?.leftChild == nil && curNode?.rightChild == nil {
            if curNode?.data == root?.data {
                root = nil
            } else {
                if isLeftChild {
                    parentNode?.leftChild = nil
                } else {
                    parentNode?.rightChild = nil
                }
            }
        } else if curNode?.rightChild == nil {
            if curNode?.data == root?.data {
                root = root?.leftChild
            } else if isLeftChild {
                parentNode?.leftChild = curNode?.leftChild
            } else {
                parentNode?.rightChild = curNode?.leftChild
            }
        } else if curNode?.leftChild == nil {
            if curNode?.data == root?.data {
                root = root?.rightChild
            } else if isLeftChild {
                parentNode?.leftChild = curNode?.rightChild
            } else {
                parentNode?.rightChild = curNode?.rightChild
            }
        }
        
        // for node with two childs
        
        if curNode?.leftChild != nil && curNode?.rightChild != nil {
            var successorParentNode = curNode
            var successorNode = curNode?.rightChild
            
            if successorNode?.leftChild == nil {
                successorNode?.leftChild = curNode?.leftChild
                
            } else {
                
                while successorNode?.leftChild != nil && successorNode?.rightChild != nil {
                    successorParentNode = successorNode
                    successorNode = successorNode?.leftChild
                }
                
                successorNode?.rightChild = curNode?.rightChild
                successorNode?.leftChild = curNode?.leftChild
                successorParentNode?.leftChild = nil
            }
            
            if isLeftChild {
                parentNode?.leftChild = successorNode
            } else {
                parentNode?.rightChild = successorNode
            }
        }
    }
    
    func printOut(node: TreeNode<T>) {
        print("======\n|data: \(node.data)|\n|left: \(node.leftChild?.data) right: \(node.rightChild?.data)|")
        if node.leftChild != nil {
            printOut(node.leftChild!)
        }
        if node.rightChild != nil {
            printOut(node.rightChild!)
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
//bTree.delete(90)

bTree.printOut(bTree.root!)

print(bTree.find(78))

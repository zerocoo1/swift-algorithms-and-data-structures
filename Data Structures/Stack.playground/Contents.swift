// Andrey Vysher 2016
// Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

// Stack:

class Stack<T: Equatable> {
    
    var container = Array<T>()
    var size: Int {
        get {
            return container.count
        }
    }
    var isEmpty: Bool {
        get {
            return size == 0
        }
    }
    
    func push(obj: T) {
        container.insert(obj, atIndex: 0)
    }
    
    func pop() -> T? {
        return isEmpty ? nil : container.removeFirst()
    }
    
    func printAll() {
        print(container)
    }
}

let newStack = Stack<Int>()

newStack.isEmpty

newStack.printAll()

newStack.push(4)
newStack.push(5)
newStack.push(7)
newStack.push(2)

newStack.printAll()

print(newStack.pop())

newStack.printAll()

print(newStack.size)

newStack.isEmpty

newStack.pop()
newStack.pop()
newStack.pop()
newStack.pop()

newStack.printAll()

print(newStack.size)

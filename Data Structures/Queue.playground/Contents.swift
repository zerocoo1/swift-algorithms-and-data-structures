// Andrey Vysher 2016
// Swift Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

class QCell<T: Equatable> {
    var key: T
    var next: QCell<T>?
    
    init(value: T) {
        key = value
    }
}

class Queue<T: Equatable> {
    
    var head: QCell<T>?
    var top: T? {
        get {
            return head!.key
        }
    }
    var size: Int {
        get {
            var nextCell = head, i = head != nil ? 1 : 0
            while nextCell?.next != nil {
                nextCell = nextCell?.next
                i += 1
            }
            
            return i
        }
    }
    
    func enqueue(key: T) {
        let qCell = QCell<T>(value: key)
        
        if head == nil {
            head = qCell
        }
        else {
            var nextCell = head
            
            while nextCell?.next != nil {
                nextCell = nextCell?.next
            }
            
            nextCell?.next = qCell
        }
    }
    
    func dequeue() -> T? {
        if head == nil {
            return nil
        }
        
        let temp = head?.key
        head = head?.next
        
        return temp
    }
    
    func printAllData() {
        
        var nextCell = head
        
        while nextCell?.next != nil {
            print("[\(nextCell?.key)]\n")
            nextCell = nextCell?.next
        }
        
        print("[\(nextCell?.key)]\n")
    }
}

///////////////
// TEST AREA //
///////////////

let q = Queue<Int>()

q.enqueue(1)
q.enqueue(2)
q.enqueue(3)
q.enqueue(6)
q.enqueue(5)

q.printAllData()

print(q.dequeue())

q.printAllData()

print(q.dequeue())
print(q.dequeue())
print(q.dequeue())
print(q.dequeue())
print(q.dequeue())

q.printAllData()

q.size
q.enqueue(9)
q.enqueue(6)
q.enqueue(5)
q.size
q.top

q.printAllData()

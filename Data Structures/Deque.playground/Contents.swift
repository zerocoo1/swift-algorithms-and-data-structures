// Andrey Vysher 2016
// Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

class DequeCell<T: Equatable> {
    
    var key: T
    var next: DequeCell<T>?
    
    init(value: T) {
        key = value
    }
}

class Deque<T: Equatable> {
    
    var head: DequeCell<T>?
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
    
    func addRight(key: T) {
        
        let cell = DequeCell<T>(value: key)
        
        if (head == nil) {
            head = cell
        }
        else {
            var nextCell = head
            
            while nextCell?.next != nil {
                nextCell = nextCell?.next
            }
            
            nextCell?.next = cell
        }
    }
    
    func addLeft(key: T) {
        
        let cell = DequeCell<T>(value: key)
        
        if (head == nil) {
            head = cell
        } else {
            cell.next = head
            head = cell
        }
    }
    
    func removeHead() {
        head = head?.next
    }
    
    func removeLast() {
        if head != nil {
            var nextCell = head
            var prevCell = head
            
            while nextCell?.next != nil {
                prevCell = nextCell!
                nextCell = nextCell?.next
                
            }
            
            prevCell?.next = nil
        }
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

let newDeque = Deque<Int>()

newDeque.addLeft(5)
newDeque.addLeft(3)
newDeque.addLeft(78)
newDeque.addLeft(2)
newDeque.addLeft(11)
newDeque.addLeft(23)
newDeque.addLeft(7)
newDeque.addRight(9)
newDeque.addRight(29)
newDeque.addRight(19)

newDeque.printAllData()

print(newDeque.size)


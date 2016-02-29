// Andrey Vysher 2016
// Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

class DLLCell<T: Equatable> {
    
    var key: T
    var next: DLLCell<T>?
    var prev: DLLCell<T>?
    
    init(value: T) {
        key = value
    }
}

class DoublyLinkedList<T: Equatable> {
    
    var head: DLLCell<T>?
    var size: Int {
        get {
            return 0
        }
    }
    
    // Add methods:
    
    func addCellHead(cell: DLLCell<T>) {
        
        if head == nil {
            head = cell
        } else {
            cell.next = head
            head = cell
            cell.next?.prev = head
        }
    }
    
    func addCellTail(cell: DLLCell<T>) {
        
        if head == nil {
            head = cell
        } else {
            var nextCell = head
            
            while nextCell?.next != nil {
                nextCell = nextCell?.next
            }
            
            nextCell?.next = cell
            cell.prev = nextCell
        }
    }
    
    func addCell(newCell: DLLCell<T>, isBefore: Bool, key: T) {
        
        if (head?.key == key && isBefore) {
            addCellHead(newCell)
            return
        }
        
        if let cell = findByKey(key, isBefore: isBefore) {
            cell.next?.prev = newCell
            newCell.next = cell.next
            newCell.prev = cell
            cell.next = newCell
        }
    }
    
    // Remove methods:
    
    func removeHead() {
        if head?.next == nil {
            head = nil
            return
        }
        
        head = head?.next
        head?.prev = nil
    }
    
    func removeTail() {
        
        if head?.next == nil {
            head = nil
            return
        }
        
        var last = head
        
        while last?.next != nil {
            last = last?.next
        }
        
        last?.prev?.next = nil
    }
    
    // Find method:
    
    func findByKey(key: T, isBefore: Bool) -> DLLCell<T>? {
        if head != nil {
            var nextCell = head
            var prevCell = head
            
            while nextCell != nil {
                if nextCell?.key == key {
                    return isBefore ? prevCell : nextCell
                }
                prevCell = nextCell!
                nextCell = nextCell?.next
                
            }
        }
        
        return nil
    }
    
    // Print method:
    
    func printAllCells() {
        
        var nextCell = head
        
        while nextCell != nil {
            print("[\(nextCell?.key)]\n")
            nextCell = nextCell?.next
        }
    }
}


///////////////
// TEST AREA //
///////////////

let dLinkedList = DoublyLinkedList<Int>()

dLinkedList.addCellHead(DLLCell<Int>(value: 5))
dLinkedList.addCellHead(DLLCell<Int>(value: 55))
dLinkedList.addCellHead(DLLCell<Int>(value: 45))
dLinkedList.addCellHead(DLLCell<Int>(value: 35))
dLinkedList.addCellHead(DLLCell<Int>(value: 25))

dLinkedList.addCellTail(DLLCell<Int>(value: 87))

dLinkedList.removeTail()
dLinkedList.removeTail()
dLinkedList.removeHead()

print(dLinkedList.findByKey(45, isBefore: true)?.key)
dLinkedList.addCell(DLLCell<Int>(value: 13), isBefore: false, key: 35)
print(dLinkedList.findByKey(45, isBefore: true)?.key)


dLinkedList.printAllCells()

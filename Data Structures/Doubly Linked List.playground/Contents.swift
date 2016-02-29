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
    
    func addCellHead(cell: DLLCell<T>) {
        if head == nil {
            head = cell
        } else {
            cell.next = head
            head = cell
            cell.next?.prev = head
        }
    }
    
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

dLinkedList.printAllCells()

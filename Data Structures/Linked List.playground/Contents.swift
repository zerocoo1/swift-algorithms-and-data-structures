// Andrey Vysher 2016
// Swift Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

// Linced List:

class LLCell<T: Equatable> {

    var key: T
    var next: LLCell<T>?

    init(value: T) {
        key = value
    }
}

class LinkedList<T: Equatable> {

    var head: LLCell<T>?
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

    func addToEnd(cell: LLCell<T>) {

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

    func addToHead(cell: LLCell<T>) {

        if (head == nil) {
            head = cell
        } else {
            cell.next = head
            head = cell
        }
    }

    func addKey(newCell: LLCell<T>, isBefore: Bool, key: T) {
        if let cell = findByKey(key, isBefore: isBefore) {
            newCell.next = cell.next
            cell.next = newCell
        }
    }

    func findByKey(key: T, isBefore: Bool) -> LLCell<T>? {
        if head != nil {
            var nextCell = head
            var prevCell = head

            while nextCell?.next != nil {
                if nextCell?.key == key {
                    return isBefore ? prevCell : nextCell
                }
                prevCell = nextCell!
                nextCell = nextCell?.next

            }
        }

        return nil
    }

    func removeHead() {
        head = head?.next
    }

    func removeWithKey(key: T) {
        if let beforeCell = findByKey(key, isBefore: true), let curCell = findByKey(key, isBefore: false) {
            beforeCell.next = curCell.next
        }
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

// create new Linked List object:
let newList = LinkedList<Int>()

// fill some data:
for var i: Int in [2, 4, 7, 3, 5, 9] {
    newList.addToEnd(LLCell<Int>(value: i * 3))
}

newList.printAllData()
print(newList.size)

print("\n##############\n")

newList.addToHead(LLCell<Int>(value: 23))
print(newList.size)

newList.printAllData()

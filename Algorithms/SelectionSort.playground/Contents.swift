// Andrey Vysher 2016
// Swift Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

func selectionSort(var arr: [Int]) -> [Int] {
    
    var minIndex: Int
    
    for a in 0..<arr.count - 1 {
        
        minIndex = a
        
        for b in a+1..<arr.count {
            if arr[b] < arr[minIndex] {
                minIndex = b
            }
        }
        
        if minIndex != a {
            swap(&arr[a], &arr[minIndex])
        }
        
        // Uncomment below to see how array changes on each iteration:
        // print(arr)
    }
    
    return arr
}

///////////////
// TEST AREA //
///////////////

selectionSort([5, 8, 9, 1, 32, 56, 7, 23, 95, 102, 37])

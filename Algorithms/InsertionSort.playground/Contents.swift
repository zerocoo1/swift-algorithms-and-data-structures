// Andrey Vysher 2016
// Swift Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

// Insertion Sort
// Algorithm complexity: O(n^2)

func insertionSort(var arr: [Int]) -> [Int] {
    
    for a in 0..<arr.count {
        let current = arr[a]
        
        var b = a - 1
        
        while b >= 0 && arr[b] > current {
            arr[b + 1] = arr[b]
            b = b - 1
        }
        
        arr[b + 1] = current
        
        // Uncomment below to see how array changes on each iteration:
        // print(arr)
    }
    
    return arr
}


///////////////
// TEST AREA //
///////////////

insertionSort([5, 8, 9, 1, 32, 56, 7, 23, 95, 102, 37])

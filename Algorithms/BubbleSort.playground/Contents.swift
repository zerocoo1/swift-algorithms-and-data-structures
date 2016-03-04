// Andrey Vysher 2016
// Swift Algorithms and data structures
// https://github.com/zerocool0686/swift-algorithms-and-data-structures

import UIKit

// BubbleSort
// Algorithm complexity: O(n^2)

func bubbleSort(arr: [Int]) -> [Int] {
    
    guard arr.count > 2 else {
        return arr
    }
    
    var outArr = arr
    
    for primaryIndex in 0..<arr.count {
        
        let passes = (outArr.count - 1) - primaryIndex
        
        for secondaryIndex in 0..<passes {
            
            let key = outArr[secondaryIndex]
            
            if (key > outArr[secondaryIndex + 1]) {
                
                swap(&outArr[secondaryIndex], &outArr[secondaryIndex + 1])
            }
        }
    }
    
    return outArr
}

///////////////
// TEST AREA //
///////////////

bubbleSort([5, 8, 9, 1, 32, 56, 7, 23, 95, 102, 37])

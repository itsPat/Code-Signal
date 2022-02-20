import UIKit

///  ** Find First and Last Position of Element in Sorted Array **

/*
 
 Given an array of integers nums sorted in ascending order, find the starting and ending position of a given target value.
 If target is not found in the array, return [-1, -1].

 Follow up: Could you write an algorithm with O(log n) runtime complexity?
 
 Example 1:
    Input: nums = [5,7,7,8,8,10], target = 8
    Output: [3,4]
 
 Example 2:
    Input: nums = [5,7,7,8,8,10], target = 6
    Output: [-1,-1]
 
 Example 3:
    Input: nums = [], target = 0
    Output: [-1,-1]

*/


var nums = [1, 1, 2, 2, 2, 2, 3, 3, 4, 5, 6, 7, 8, 8, 8, 8, 8, 8, 8, 8, 9, 10, 15, 19]

enum Occurence {
    case first, last
}

func index(_ type: Occurence, for num: Int, in nums: [Int]) -> Int? {
    
    var left = 0
    var right = nums.count - 1
    var potentialIndex: Int?
    
    // Until we find atleast one occurence of the target, perform a regular binary search.
    while left <= right,
          potentialIndex == nil {
        let middle = (left + right) / 2
        let middleValue = nums[middle]
        switch middleValue {
        case num:
            potentialIndex = middle
        case let x where num > x:
            left = middle + 1
        case let x where num < x:
            right = middle - 1
        default:
            continue
        }
    }
    
    // We have found an index, not depending on the type of occcurence we are looking for
    // Traverse left or right in the array.
    if var index = potentialIndex {
        let offset = type == .first ? -1 : 1
        while index + offset >= 0 && index + offset < nums.count,
              nums[index + offset] == num {
            index += offset
        }
        return index
    }
    return nil
}

if let index = index(.first, for: 1, in: nums) {
    print(index)
}



unc insertionSort(nums: inout [Int]) -> [Int] { 
//     for i in 1..<nums.count { 
//         let tmp: Int = nums[i]
//         var j: Int = i - 1
//         while j >= 0 && tmp < nums[j] { 
//             nums[j+1] = nums[j]
//             j -= 1 
//         }
//         nums[j+1] = tmp
//     }
//     return nums
// }
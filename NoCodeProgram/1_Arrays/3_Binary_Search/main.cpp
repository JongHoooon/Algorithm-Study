#include <iostream>
#include <vector>

int binarySearch(const std::vector<int>& nums, int target)
{
  int leftIdx = 0;
  int rightIdx = nums.size() - 1;

  while(leftIdx <= rightIdx)
  { 
    const int centerIdx = (leftIdx + rightIdx) / 2;
    const int centerVal = nums[centerIdx];

    if(centerVal == target) 
    {
      return centerIdx;
    }

    if(target < centerVal)
    {
      rightIdx -= 1;    
      continue;
    }

    if(target > centerVal)
    { 
      leftIdx += 1;
      continue;
    }
  }

  return -1;
}

int main() 
{
  std::cout << binarySearch({1, 2, 3, 4, 5, 6, 7, 8, 9}, 4) << std::endl;
}
#include <iostream>
#include <vector>
#include <algorithm>
#include <numeric>

using namespace std;

size_t n = 9;
size_t r = 7;
vector<int> nums(9);
vector<int> current_nums;

void make_permutation(int index) {
  if(current_nums.size() == r) { 
    if(100 == accumulate(current_nums.begin(), current_nums.end(), 0)) { 
      sort(current_nums.begin(), current_nums.end());
      for(int n : current_nums) { 
        cout << n << '\n';
      }
      exit(0);
    }
  }

  for(int i = index; i < n; ++i) { 
    current_nums.push_back(nums[i]);
    make_permutation(index + 1);
    current_nums.pop_back();
  }
}

int main(void) { 
  for(int i = 0; i < n; ++i) { 
    cin >> nums[i];
  }
  make_permutation(0);
  return 0;
}
#include <iostream>
#include <vector>

using namespace std;

const vector<int> nums = {1, 2, 3, 4, 5, 6, 7, 8, 9};
int cnt = 0;

void make_combination(int index , vector<int> current_nums) { 
  if(current_nums.size() == 3) {
    for(int num : current_nums) {
      cout << num << " ";
    }
    cout << '\n';
    return;
  }
  for(int i = index; i < nums.size(); ++i) { 
    vector<int> next_nums = current_nums;
    next_nums.push_back(nums[i]);
    make_combination(i + 1, next_nums);
  }
}

int main(void) {
  make_combination(0, { });
}
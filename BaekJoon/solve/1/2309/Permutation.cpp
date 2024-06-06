#include <iostream>
#include <vector>

using namespace std;

int nums[5] = {1, 2, 3, 4, 5};
bool visited[5];

void make_permutation(vector<int> current_nums) {
  if(current_nums.size() == 3) {
    for(int n : current_nums) { 
      cout << n << " ";
    }
    cout << "\n";
    return;
  }

  for(int i = 0; i < 5; ++i) { 
    if(visited[i] == true) { 
      continue;
    } else { 
      visited[i] = true;
      vector<int> next_nums = current_nums;
      next_nums.push_back(nums[i]);
      make_permutation(next_nums);
      visited[i] = false; 
    }
  }
}

int main(void) { 
  make_permutation({ });
  return 0;
}

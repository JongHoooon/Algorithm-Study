#include<iostream>
#include<vector>
#include<numeric>
#include<algorithm>

using namespace std;

int N, K;
int input;
vector<int> nums;

int main(void) { 
  cin >> N >> K;
  for(int i = 0; i < N; ++i) {
    cin >> input;
    nums.push_back(input);
  }
  
  int start = 0;
  int end = K;
  int max_num = accumulate(nums.begin(), nums.begin() + K, 0);
  int current_sum = accumulate(nums.begin(), nums.begin() + K, 0);
  while(end < N) { 
    current_sum = current_sum - nums[start] + nums[end];
    max_num = max(max_num, current_sum);
    start++;
    end++;
  }

  cout << max_num << '\n';
  return 0;
}

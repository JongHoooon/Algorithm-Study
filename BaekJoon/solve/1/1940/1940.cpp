#include <iostream>
#include <vector>
#include <numeric>

using namespace std;

int N, M;
int input;
vector<int> nums;
vector<int> current_nums;
int answer = 0;

void make_permutation(int index, const vector<int> & current) {
  if(current.size() == 2) { 
    if(current[0] + current[1] == M) {
      ++answer;
    }
    return;
  }

  for(int i = index; i < N; ++i) { 
    current_nums.push_back(nums[i]);
    make_permutation(i + 1, current_nums);
    current_nums.pop_back();
  }
}

int main(void) { 
  ios_base::sync_with_stdio(false);
  cin.tie(NULL); cout.tie(NULL);

  cin >> N >> M;
  for(int i = 0; i < N; ++i) { 
    cin >> input;
    nums.push_back(input);
  }

  make_permutation(0, current_nums);
  cout << answer << '\n';

  return 0;
}



/*
- 2개 합쳐서 M이 되면 갑옷이 만들어 진다.
N개의 재료와 M이 주어졌을 때 몇개의 갑옷을 만들 수 있는지..
*/
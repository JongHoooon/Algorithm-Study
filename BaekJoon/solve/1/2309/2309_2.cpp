#include <iostream>
#include <vector>
#include <numeric>
#include <algorithm>

using namespace std;

int n = 9;
int r = 7;
vector<int> heights;
vector<int> current_heights;

void slove() { 
  int n = accumulate(current_heights.begin(), current_heights.end(), 0);
  if(n == 100) { 
    sort(current_heights.begin(), current_heights.end());
    for(int n : current_heights) { 
      cout << n << '\n';
    }
    exit(0);
  }
}


void make_permutation(int depth) { 
  if(depth == r) { 
    slove();
    return;
  }

  for(int i = depth; i < n; ++i) { 
    current_heights.push_back(heights[i]);
    make_permutation(depth + 1);
    current_heights.pop_back();
  }
}

int main(void) { 
  for(int i = 0; i < n; ++i) { 
    int n;
    cin >> n;
    heights.push_back(n);
  }
  make_permutation(0);
}
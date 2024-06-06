#include<iostream>
#include<vector>
#include<algorithm>

using namespace std;

int n = 9;
int r = 7;
int heights[9];
int current_heights[7];

void makePermutation(int depth) { 
  if(depth == r) { 
    int sum = 0;
    for(int i = 0; i < r; ++i) sum += heights[i];
    if(sum == 100) { 
      sort(heights, heights + r);
      for(int i = 0; i < r; ++i) { 
        cout << heights[i] << "\n";
      }
      exit(0);
    }
    return;
  }
  for(int i = depth; i < n; ++i) { 
    swap(heights[i], heights[depth]);
    makePermutation(depth + 1);
    swap(heights[i], heights[depth]);
  }
  return;
}

int main() { 
  for(int i = 0; i < 9; ++i) { 
    cin >> heights[i];
  }
  makePermutation(0);
  return 0;
}



// 7명이 아닌 9명있음
// 7명 키의 합 == 100
// 

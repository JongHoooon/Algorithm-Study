#include <iostream>
#include <vector>

using namespace std;
const int n = 3;
const int m = 4;

void rotate_left_90(vector<vector<int>> &key) { 
  int n = key.size();
  int m = key[0].size();
  vector<vector<int>> temp(m, vector<int>(n, 0));

  for(int i = 0; i < m; ++i) {
    for(int j = 0; j < n; ++j) { 
      temp[i][j] = key[j][m - i - 1];
    }
  }
  key.resize(m);
  key[0].resize(n);
  key = temp;
  return;
}

void rotate_right_90(vector<vector<int>> &key) { 
  int n = key.size();
  int m = key[0].size();
  vector<vector<int>> temp(m, vector<int>(n, 0));
  for(int i = 0; i < m; ++i) { 
    for(int j = 0; j < n; ++i) { 
      temp[i][j] = key[n - j - 1][i];
    }
  }
  key.resize(m);
  key[0].resize(n);
  key = temp;
  return;
}

int main(void) { 
  vector<vector<int>> a = { 
    {1, 2, 3, 4},
    {5, 6, 7, 8},
    {9, 10, 11, 12}
  };
  rotate_left_90(a);
  for(int i = 0; i < a.size(); ++i) {
    for(int j = 0 ; j < a[0].size(); ++j) { 
      cout << a[i][j] << " ";
    }
    cout << "\n";
  }
}
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

const int max_n = 104;
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int a[max_n][max_n];
bool v[max_n][max_n];
int m, n, k;
int x_1, y_1, x_2, y_2;
int cnt = 0;
vector<int> cnt_v;

void dfs(int y, int x) { 
  v[y][x] = true;
  ++cnt;
  for(int i = 0; i < 4; ++i) { 
    int ny = y + dy[i];
    int nx = x + dx[i];
    if(nx < 0 || ny < 0 || nx >= n || ny >= m) continue;
    if(v[ny][nx]) continue;
    if(a[ny][nx] != 0) continue;
    dfs(ny, nx);
  }
}

int main(void) {
  cin >> m >> n >> k;
  for(int i = 0; i < k; ++i) { 
    cin >> x_1 >> y_1 >> x_2 >> y_2;
    for(int y = y_1; y < y_2; ++y) { 
      for(int x = x_1; x < x_2; ++x) { 
        a[y][x] = 1;
      }
    }
  }
  for(int y = 0; y < m; ++y) {
    for(int x = 0; x < n; ++x) { 
      if(v[y][x] || a[y][x] != 0) continue;
      cnt = 0;
      dfs(y, x);
      cnt_v.push_back(cnt);
    }
  }
  sort(cnt_v.begin(), cnt_v.end());
  cout << cnt_v.size() << '\n';
  for(int c : cnt_v) {
    cout << c << " ";
  }
  cout << '\n';
  return 0;
}

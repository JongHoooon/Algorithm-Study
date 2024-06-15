#include <iostream>
using namespace std;

const int max_n = 104;
int n, cnt;
int a[max_n][max_n];
bool visited[max_n][max_n];
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int ret = 1;

void dfs(int d, int y, int x) { 
  visited[y][x] = true;
  for(int i = 0; i < 4; ++i) { 
    int ny = y + dy[i];
    int nx = x + dx[i];
    if(nx < 0 || nx >= n || ny < 0 || ny >= n) continue;
    if(visited[ny][nx] || a[ny][nx] <= d) continue;
    dfs(d, ny, nx);
  }
}

int main(void) { 
  cin >> n;
  for(int y = 0; y < n; ++y) { 
    for(int x = 0; x < n; ++x) {
      cin >> a[y][x]; 
    }
  }
  for(int d = 1; d <= max_n; ++d) {
    fill(&visited[0][0], &visited[0][0] + max_n * max_n, false);
    cnt = 0;
    for(int y = 0; y < n; ++y) {
      for(int x = 0; x < n; ++x) { 
        if(visited[y][x] || a[y][x] <= d) continue;
        dfs(d, y, x);
        ++cnt;
      }
    }
    ret = max(cnt, ret);
  }
  cout << ret << '\n';
  return 0;
}

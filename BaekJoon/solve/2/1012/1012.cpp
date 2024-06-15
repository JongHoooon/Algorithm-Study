#include<iostream>
using namespace std;

int t, m, n, k, y, x;
int a[52][52];
bool visited[52][52];
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int cnt;

void dfs(int y, int x) { 
  visited[y][x] = true;
  for(int i = 0; i < 4; ++i) { 
    int ny = y + dy[i];
    int nx = x + dx[i];
    if(nx < 0 || nx >= m || ny < 0 || ny >= n) continue;
    if(visited[ny][nx]) continue;
    if(a[ny][nx] == 0) continue;
    dfs(ny, nx);
  }
}

int main(void) { 
  cin >> t;
  for(int i = 0; i < t; ++i) { 
    cin >> m >> n >> k;
    fill(&a[0][0], &a[0][0] + 52 * 52, 0);
    fill(&visited[0][0], &visited[0][0] + 52 * 52, 0);
    cnt = 0;
    for(int j = 0; j < k; ++j) {
      cin >> x >> y;
      a[y][x] = 1;
    }

    for(int y = 0; y < n; ++y) { 
      for(int x = 0; x < m; ++x) { 
        if(a[y][x] == 0 || visited[y][x]) continue;
        dfs(y, x);
        ++cnt;
      }
    }
    cout << cnt << '\n';
  }

  return 0;
}

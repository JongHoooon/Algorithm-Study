#include <iostream>
#include <vector>
#include <tuple>
#include <queue>
#include <cstring>
using namespace std;

const int max_n = 52;
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int n, m, a[max_n][max_n], visited[max_n][max_n], ret;
string input;

int bfs(int y, int x) { 
  memset(visited, -1, sizeof(visited));
  queue<pair<int, int>> q;
  visited[y][x] = 0;
  q.push({y, x});
  while(q.empty() == false) { 
    pair<int, int> c = q.front();
    q.pop();
    for(int i = 0; i < 4; ++i) { 
      int ny = c.first + dy[i];
      int nx = c.second + dx[i];
      if(ny < 0 || nx < 0 || ny >= n || nx >= m || visited[ny][nx] != -1 || a[ny][nx] == 0) continue;  
      visited[ny][nx] = visited[c.first][c.second] + 1;
      ret = max(ret, visited[ny][nx]);
      q.push({ny, nx});
    }
  }
  return -1;
}

int main(void) { 
  cin >> n >> m;
  for(int i = 0; i < n; ++i) {
    cin >> input;
    for(int j = 0; j < m; ++j) { 
      if(input[j] == 'L') { 
        a[i][j] = 1;
      } else { 
        a[i][j] = 0;
      }
    }
  }
  
  for(int i = 0; i < n; ++i) {
    for(int j = 0; j < m; ++j) { 
      if(a[i][j] == 1) { 
        bfs(i, j);
      }
    }
  }
  cout << ret << '\n';
  return 0;
}

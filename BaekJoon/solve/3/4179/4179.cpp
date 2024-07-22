#include <iostream>
#include <vector>
#include <tuple>
#include <queue>
#include <limits>
using namespace std;

const int INF = numeric_limits<int>::max();
const int max_n = 1004;
char a[max_n][max_n];
int n, m, sx, sy, dx[4] = {-1,0,1,0}, dy[4] = {0,-1,0,1}, ret = -1, y, x;
int fire_check[max_n][max_n], person_check[max_n][max_n];
bool in(int a, int b) {
  return 0 <= a && a < n && 0 <= b && b < m;
}

int main(void) { 
  queue<pair<int, int>> q;
  cin >> n >> m;
  fill(&fire_check[0][0], &fire_check[0][0] + max_n * max_n, INF);
  for(int i = 0; i < n; ++i) { 
    for(int j = 0; j < m; ++j) { 
      cin >> a[i][j];
      if(a[i][j] == 'F') { 
        fire_check[i][j] = 1;
        q.push({i, j});
      } else if(a[i][j] == 'J') { 
        sy = i; sx = j;
      }
    }
  }

  while(q.empty() == false) { 
    tie(y, x) = q.front();
    q.pop();
    for(int i = 0; i < 4; ++i) { 
      int ny = y + dy[i];
      int nx = x + dx[i];
      if(in(ny, nx) == false) continue;
      if(fire_check[ny][nx] != INF || a[ny][nx] == '#') continue;
        fire_check[ny][nx] = fire_check[y][x] + 1;
        q.push({ny, nx});
    }
  }

  person_check[sy][sx] = 1;
  q.push({sy, sx});
  while(q.empty() == false) { 
    int y = q.front().first;
    int x = q.front().second;
    q.pop();
    if(x == m - 1 || y == n - 1 || x == 0 || y == 0) { 
      ret = person_check[y][x];
      break;
    }
    for(int i = 0; i < 4; i++){
			int ny = y + dy[i];
			int nx = x + dx[i];
      if(in(ny, nx) == false) continue;
      if(person_check[ny][nx] || a[ny][nx] == '#') continue;
      if(fire_check[ny][nx] <= person_check[y][x] + 1) continue;
      person_check[ny][nx] = person_check[y][x] + 1;
      q.push({ny, nx});
    }
  }
  if(ret != -1) cout << ret << '\n';
  else cout << "IMPOSSIBLE" << '\n';
  return 0;
}

/*
지훈, 불
- 미로의 가장자리에 접근해 탈출
- 벽은 통과 못함
*/
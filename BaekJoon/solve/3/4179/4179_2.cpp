#include <iostream>
#include <limits>
#include <tuple>
#include <queue>
using namespace std;

const int INF = numeric_limits<int>::max();
const int max_n = 1004;
const int dy[4] = {-1,0,1,0};
const int dx[4] = {0,-1,0,1};
char a[max_n][max_n];
int f_check[max_n][max_n], j_check[max_n][max_n];
int r, c, y, x, ret = -1;
pair<int, int> j_position; 
pair<int, int> f_position;

int main(void) { 
  cin >> r >> c;
  for(int i = 0; i < r; ++i) { 
    for(int j = 0; j < c; ++j) { 
      cin >> a[i][j];
      if(a[i][j] == 'J') { 
        j_position = {i, j};
      } else if(a[i][j] == 'F') { 
        f_position = {i, j};
      }
    }
  }

  // check fire
  queue<pair<int, int>> q;
  fill(&f_check[0][0], &f_check[0][0] + max_n * max_n, INF);
  f_check[f_position.first][f_position.second] = 1;
  q.push(f_position);
  while(q.empty() == false) { 
    tie(y, x) = q.front();
    q.pop();
    for(int i = 0; i < 4; ++i) { 
      int ny = y + dy[i];
      int nx = x + dx[i];
      if(ny < 0 || nx < 0 || ny >= r || nx >= c) continue;
      if(f_check[ny][nx] != INF || a[ny][nx] == '#') continue;
      f_check[ny][nx] = f_check[y][x] + 1;
      q.push({ny, nx});
    }
  }

  // check j
  q.push(j_position);
  j_check[j_position.first][j_position.second] = 1;
  while(q.empty() == false) { 
    tie(y, x) = q.front();
    q.pop();
    if(y == 0 || x == 0 || y == r - 1 || x == c - 1) { 
      ret = j_check[y][x];
      break;
    }
    for(int i = 0; i < 4; ++i) { 
      int ny = y + dy[i];
      int nx = x + dx[i];
      if(ny < 0 || nx < 0 || ny >= r || nx >= c) continue;
      if(j_check[ny][nx] || a[ny][nx] == '#') continue;
      if(f_check[ny][nx] <= j_check[y][x] + 1) continue;
      j_check[ny][nx] = j_check[y][x] + 1;
      q.push({ny , nx});
    }
  }

  if(ret == -1) { 
    cout << "IMPOSSIBLE" << '\n';
  } else { 
    cout << ret << '\n';
  }
  return 0;
}
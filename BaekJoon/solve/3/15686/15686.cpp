#include <iostream>
#include <vector>
#include <tuple>
#include <queue>
using namespace std;

const int max_n = 52;
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int n, m, a[max_n][max_n], visited[max_n][max_n];
int ret = 50 * 50 * 100;
vector<pair<int, int>> chicken_v;
vector<pair<int, int>> home_v;

int bfs(int y, int x) { 
  queue<pair<int, int>> q;
  q.push({y, x});
  while(q.empty() == false) { 
    pair<int, int> c = q.front();
    q.pop();
    for(int i = 0; i < 4; ++i) { 
      int ny = dy[i] + c.first;
      int nx = dx[i] + c.second;
      if(ny < 0 || nx < 0 || ny >= n || nx >= n || visited[ny][nx] != -1) continue;
      visited[ny][nx] = visited[c.first][c.second] + 1;
      if(a[ny][nx] == 2) return visited[ny][nx];
      q.push({ny, nx});
    }
  }
  return 0;
}

int slove(vector<pair<int, int>>& selected_v) { 
  int ret = 0;
  for(auto p : selected_v) { 
    a[p.first][p.second] = 0;
  }
  for(auto p : home_v) { 
    fill(&visited[0][0], &visited[0][0] + max_n * max_n, -1);
    visited[p.first][p.second] = 0;
    ret += bfs(p.first, p.second);
  }
  for(auto p : selected_v) { 
    a[p.first][p.second] = 2;
  }
  return ret;
}

void combi(int index, vector<pair<int, int>>& selected_v) { 
  if(selected_v.size() == (chicken_v.size() - m)) {
    int s = slove(selected_v);
    ret = min(s, ret);
    return;
  }

  for(int i = index; i < chicken_v.size(); ++i) { 
    selected_v.push_back(chicken_v[i]);
    combi(i + 1, selected_v);
    selected_v.pop_back();
  }
}

int main(void) { 
  cin >> n >> m;
  for(int i = 0; i < n; ++i) { 
    for(int j = 0; j < n; ++j) { 
      cin >> a[i][j];
      if(a[i][j] == 1) home_v.push_back({i, j});
      if(a[i][j] == 2) chicken_v.push_back({i, j});
    }
  }
  vector<pair<int, int>> selected = { };
  combi(0, selected);
  cout << ret << endl;
  return 0;
}

#include <iostream>
#include <vector>
#include <tuple>
using  namespace std;

const int max_n = 8;
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int n, m, map[max_n][max_n], visited[max_n][max_n], ret;
vector<pair<int, int>> empty_list, virus_list, selected;

void dfs(int y, int x) { 
  visited[y][x] = 1;
  for(int i = 0; i < 4; ++i) { 
    int ny = y + dy[i];
    int nx = x + dx[i];
    if(ny < 0 || nx < 0 || ny >= n || nx >= m) continue;
    if(map[ny][nx] == 1 || visited[ny][nx]) continue;
    dfs(ny, nx);
  }
}

int solve() {
  for(pair<int, int> p : selected) { 
    map[p.first][p.second] = 1;
  }
  fill(&visited[0][0], &visited[0][0] + max_n * max_n, 0);
  for(pair<int, int> p : virus_list) {
    dfs(p.first, p.second);
  }

  int cnt = 0;
  for(int i = 0; i < n; ++i) { 
    for(int j = 0; j < m; ++j) { 
      if(map[i][j] == 0 && visited[i][j] == 0) ++cnt;
    }
  }
  for(pair<int, int> p : selected) { 
    map[p.first][p.second] = 0;
  }
  return cnt;
}

void combi(int index) { 
  if(selected.size() == 3) {
    ret = max(ret, solve());
    return;
  }
  for(int i = index; i < empty_list.size(); ++i) { 
    selected.push_back(empty_list[i]);
    combi(i + 1);
    selected.pop_back();
  }
}

int main(void) { 
  cin >> n >> m;
  for(int i = 0; i < n; ++i) { 
    for(int j = 0; j < m; ++j) { 
      cin >> map[i][j];
      if(map[i][j] == 0) empty_list.push_back({i, j});
      if(map[i][j] == 2) virus_list.push_back({i, j});
    }
  }
  combi(0);
  cout << ret << '\n';
  return 0;
}




/*
#include <iostream>
#include <vector>
#include <tuple>
using namespace std;

const int max_n = 8;
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int n, m, map[max_n][max_n], visited[max_n][max_n], input;
int ret = 0;
vector<pair<int, int>> empty_vector;
vector<pair<int, int>> virus_vector;
vector<pair<int, int>> selected;

void dfs(int y, int x) {
  visited[y][x] = 1;
  for(int i = 0; i < 4; ++i) { 
    int ny = y + dy[i];
    int nx = x + dx[i];
    if(ny < 0 || nx < 0 || ny >= n || nx >= m || map[ny][nx] == 1) continue;
    if(visited[ny][nx]) continue;
    visited[ny][nx] = 1;
    dfs(ny, nx);
  }
  return;
}

int solve(const vector<pair<int, int>>& selected_walls) {
  for(auto p : selected_walls) { 
    cout << "selected y : " << p.first << " y : " << p.second << endl;
    map[p.first][p.second] = 1;
  }
  fill(&visited[0][0], &visited[0][0] + max_n * max_n, 0);
  for(auto v : virus_vector) { 
    dfs(v.first, v.second);
  }
  int cnt = 0;
  for(int i = 0; i < n; ++i) {
    for(int j = 0; j < m; ++j) {
      if(map[i][j] == 0 && visited[i][j] == 0) ++cnt;
    }
  } 
  for(auto p : selected_walls) { 
    map[p.first][p.second] = 0;
  }
  cout << "count : " << cnt << endl;
  return cnt;  
}

void combi(int index, vector<pair<int, int>>& selected_walls) { 
  if(selected_walls.size() == 3) { 
    int safe_cnt = solve(selected_walls);
    ret = max(ret, safe_cnt);
    return;
  }

  for(int i = index; i < empty_vector.size(); ++i) { 
    selected_walls.push_back(empty_vector[i]);
    combi(i + 1, selected_walls);
    selected_walls.pop_back();
  }
}

int main(void) { 
  cin >> n >> m;
  for(int i = 0; i < n; ++i) { 
    for(int j = 0; j < m; ++j) { 
      cin >> input;
      map[i][j] = input;
      if(input == 0) empty_vector.push_back({i, j}); continue;
      if(input == 2) virus_vector.push_back({i, j}); continue;
    }
  }
  combi(0, selected);
  cout << ret << endl;
  return 0;
}
*/

/*
n * m
- 빈칸 - 0
- 벽 - 1
- 바이러스 - 2

벽 3개를 꼭 세워야함

*/
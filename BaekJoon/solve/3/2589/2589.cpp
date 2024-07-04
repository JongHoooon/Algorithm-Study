#include <iostream>
#include <vector>
#include <tuple>
#include <queue>
using namespace std;

const int max_n = 52;
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int n, m, a[max_n][max_n], visited[max_n][max_n], ret;
vector<pair<int, int>> land_v, selected_v;
string input;

int bfs(vector<pair<int, int>>& selected) { 
  queue<pair<int, int>> q;
  visited[selected[0].first][selected[0].second] = 0;
  q.push(selected[0]);
  while(q.empty() == false) { 
    pair<int, int> c = q.front();
    q.pop();
    for(int i = 0; i < 4; ++i) { 
      int ny = c.first + dy[i];
      int nx = c.second + dx[i];
      if(ny < 0 || nx < 0 || ny >= n || nx >= m || visited[ny][nx] != -1 || a[ny][nx] == 0) continue;  
      visited[ny][nx] = visited[c.first][c.second] + 1;
      if(ny == selected[1].first && nx == selected[1].second) return visited[ny][nx];
      q.push({ny, nx});
    }
  }
  return -1;
}

void combi(int index, vector<pair<int, int>>& selected) { 
  if(selected.size() == 2) { 
    fill(&visited[0][0], &visited[0][0] + max_n * max_n, -1);
    int temp = bfs(selected);
    if(temp != -1) { 
      ret = max(ret, temp);
    }
    return;
  }

  for(int i = index; i < land_v.size(); ++i) { 
    selected.push_back(land_v[i]);
    combi(i + 1, selected);
    selected.pop_back();
  }
}

int main(void) { 
  cin >> n >> m;
  for(int i = 0; i < n; ++i) {
    cin >> input;
    for(int j = 0; j < m; ++j) { 
      if(input[j] == 'L') { 
        a[i][j] = 1;
        land_v.push_back({i, j});
      } else { 
        a[i][j] = 0;
      }
    }
  }
  
  combi(0, selected_v);
  cout << ret << '\n';
  return 0;
}




/*
L - 육지
W - 바다

- 육지로만 가능
- 이동시 1시간 걸림

- 최단거리 이동시 가장 긴 시간이 걸리는 육지 두곳에
- 
*/
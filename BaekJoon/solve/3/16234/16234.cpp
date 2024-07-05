#include <iostream>
#include <vector>
#include <tuple>
#include <numeric>
using namespace std;

const int max_n = 52;
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};

int N, L, R, r, c, map[max_n][max_n], visited[max_n][max_n], day;
vector<pair<int, int>> temp;

void dfs(int y, int x) { 
  temp.push_back({y, x});
  visited[y][x] = 1;
  for(int i = 0; i < 4; ++i) { 
    int ny = dy[i] + y;
    int nx = dx[i] + x;
    if(ny < 0 || nx < 0 || ny >= N || nx >= N || visited[ny][nx]) continue;
    if(abs(map[y][x] - map[ny][nx]) < L || abs(map[y][x] - map[ny][nx]) > R) continue;
    dfs(ny, nx);
  }
}

int main(void) { 
  cin >> N >> L >> R;
  for(int i = 0; i < N; ++i) { 
    for(int j = 0; j < N; ++j) { 
      cin >> map[i][j];
    }
  }

  while(true) { 
    bool needReturn = true;
    fill(&visited[0][0], &visited[0][0] + max_n * max_n, 0);
    for(int i = 0; i < N; ++i) {
      for(int j = 0; j < N; ++j) { 
        temp = { };
        if(visited[i][j]) continue;
        dfs(i, j);
        if(temp.size() == 1) continue;
        needReturn = false;
        int sum = 0;
        for(auto c : temp) {
          sum += map[c.first][c.second];
        }
        for(auto c : temp) {
          map[c.first][c.second] = sum / temp.size();
        }
      }
    }
    if(needReturn == true) { 
      cout << day << endl;
      return 0;
    } else { 
      ++day;
    }
  }

  return 0;
}


/*
- 국경선 공유하는 두 나라의 인구 차이가 L명 이상, R명 이하면 오픈
- 연합의 인구수 / 개수
- 닫음

*/
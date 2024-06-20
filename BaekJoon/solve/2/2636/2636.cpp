#include <iostream>
using namespace std;

const int max_n = 100;
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int n, m, map[max_n][max_n], visited[max_n][max_n], cnt_cheese, temp_cheese_cnt, t;

void dfs(int y, int x) { 
  visited[y][x] = 1;
  for(int i = 0; i < 4; ++i) { 
    int ny = y + dy[i];
    int nx = x + dx[i];
    if(ny < 0 || nx < 0 || ny >= n || nx >= m || visited[ny][nx] == 1) continue;
    if(map[ny][nx] == 1) { 
      visited[ny][nx] = 1;
      map[ny][nx] = 0;
      ++temp_cheese_cnt;
    } else { 
      dfs(ny, nx);
    }
  }
  return;
}

int main(void) { 
  cin >> n >> m;
  for(int i = 0; i < n; ++i) { 
    for(int j = 0; j < m; ++j) { 
      cin >> map[i][j];
    }
  }

  while(true) { 
    fill(&visited[0][0], &visited[0][0] + max_n * max_n, 0);
    temp_cheese_cnt = 0;
    dfs(0, 0);
    if(temp_cheese_cnt == 0) break;
    ++t;
    cnt_cheese = temp_cheese_cnt;
  }

  cout << t << '\n';
  cout << cnt_cheese << '\n';
  return 0;
}


/*
- 정사각형 칸들 사각형 모양
- 위에 얇은 치즈(회색)
- 가장자리에는 치즈 X
- 하나 이상의 구멍이 있을 수 있다.
- 
*/
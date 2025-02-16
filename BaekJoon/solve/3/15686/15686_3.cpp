#include <iostream>
#include <vector>
#include <tuple>
#include <queue>
using namespace std;

const int max_n = 52;
const int dy[4] = {-1, 1, 0, 0};
const int dx[4] = {0, 0, -1, 1};
int N, M, a[max_n][max_n];
int result = (max_n + max_n) * (max_n * max_n);
vector<pair<int, int>> chick_v, house_v;

int solve(vector<pair<int, int>>& selected_v) { 
  int sum = 0;
  for(auto home : house_v) { 
    int d = (max_n + max_n) * (max_n * max_n);
    for(auto chick : selected_v) { 
      d = min(abs(home.first - chick.first) + abs(home.second - chick.second), d);
    }
    sum += d;
  }
  return sum;
}

void combi(int index, vector<pair<int, int>>& selected_v) { 
  if(selected_v.size() == M) { 
    int s = solve(selected_v);
    result = min(result, s);
    return;
  }

  for(int i = index; i < chick_v.size(); ++i) { 
    selected_v.push_back(chick_v[i]);
    combi(i + 1, selected_v);
    selected_v.pop_back();
  }
}

int main(void) { 
  cin >> N >> M;
  for(int i = 0; i < N; ++i) { 
    for(int j = 0; j < N; ++j) { 
      cin >> a[i][j];
      if(a[i][j] == 1) { 
        house_v.push_back({i, j});
      }
      if(a[i][j] == 2) { 
        chick_v.push_back({i, j});
      }
    }
  }

  vector<pair<int, int>> selected_v = { };
  combi(0, selected_v);
  cout << result << endl;
  return 0;
}



/*
치킨 거리: 집과 가장 가까운 치킨집 사이의 거리, 집을 기준으로 정해짐
도시의 치킨 거리는모든 집의 치킨 거리의 합.

도시의 치킨 거리가 가장작은 M개를 고른다.

0: 빈칸
1: 집
2: 치킨 집
N, M

1. 전체 치킨집 입력 받음
2. 전체 치킨집 중 M 개 선택 -> 가장작은 치킨 거리 선택 -> 이때 도시의 치킨 거리 최솟값 기록
*/

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

int slove(vector<pair<int, int>>& selected_v) { 
  int ret = 0;
  for(auto home : home_v) { 
    int d = 200;
    for(auto chicken : selected_v) { 
      d = min(abs(home.first - chicken.first) + abs(home.second - chicken.second), d);
    }
    ret += d;
  }
  return ret;
}

void combi(int index, vector<pair<int, int>>& selected_v) { 
  if(selected_v.size() == m) {
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

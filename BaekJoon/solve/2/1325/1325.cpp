#include <iostream>
#include <vector>
#include <cstring>
using namespace std;

int n, m, a, b, mx;
vector<int> adj[10001];
int visited[10001];
int dp[10001];

int dfs(int root) {
  visited[root] = 1;
  int ret = 1;
  for(int i : adj[root]) { 
    if(visited[i]) continue;
    ret += dfs(i);
  }
  return ret;
}

int main(void) { 
  cin >> n >> m;
  for(int i = 0; i < m; ++i) { 
    cin >> a >> b;
    adj[b].push_back(a);   
  }
  for(int i = 1; i <= n; ++i) { 
    memset(visited, 0, sizeof(visited));
    dp[i] = dfs(i);
    mx = max(mx, dp[i]);
  }
  for(int i = 1; i <= n; ++i) { 
    if(dp[i] == mx) cout << i << " ";
  }
  cout << '\n';
  return 0;
}

#include <iostream>
#include <vector>
using namespace std;

int n, input, d, root;
vector<int> v[50];

int dfs(int root) { 
  if(root == d) return 0;
  int ret = 0;
  int child = 0;
  for(int i : v[root]) {
    if(i == d) continue;
    ++child;
    ret += dfs(i);
  } 
  if(child == 0) return 1; 
  else return ret;
}

int main(void) {
  cin >> n;
  for(int i = 0; i < n; ++i) { 
    cin >> input;
    if(input == -1) root = i;
    else v[input].push_back(i);
  }
  cin >> d;
  cout << dfs(root) << '\n';
  return 0;
}


/*
리프 노드 - 자식의 개수가 0인 노드

- 지우기
- 리프 노드인지?
*/

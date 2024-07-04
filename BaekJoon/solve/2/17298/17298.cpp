#include <iostream>
#include <vector>
#include <stack>
#include <cstring>
using namespace std;

int n, mx, prev;
vector<int> v;
int ret[1000004];
int a[1000004];
stack<int> s;

int main(void) {
  cin >> n;
  memset(ret, -1, sizeof(ret));
  for(int i = 0; i < n; ++i) { 
    cin >> a[i];
    while(!s.empty() && a[s.top()] < a[i]) { 
      ret[s.top()] = a[i];
      s.pop();
    }
    s.push(i);
  }
  for(int i = 0; i < n; ++i) { 
    cout << ret[i] << " ";
  }
  cout << '\n';
  return 0;
}

/*
오른쪽에 있으면서 Aj 보다 큰 수 중에서 가장 왼쪽에 있는 수


*/
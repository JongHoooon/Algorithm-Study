#include<iostream>
#include<stack>
using namespace std;

int n, ret;
string s;

int main(void) { 
  ios_base::sync_with_stdio(false);
  cin.tie(NULL); cout.tie(NULL);

  cin >> n;
  for(int i = 0; i < n; ++i) { 
    cin >> s;
    stack<char> stk;
    for(char a : s) { 
      if(stk.size() && stk.top() == a) stk.pop();
      else stk.push(a);
    }
    if(stk.size() == 0) { 
      ++ret;
    }
  }

  cout << ret << '\n';

  return 0;
}
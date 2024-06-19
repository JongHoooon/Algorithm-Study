#include <iostream>
#include <stack>
using namespace std;

int n;
string s;

int main(void) { 
  cin >> n;
  for(int i = 0; i < n; ++i) { 
    bool needContinue = false;
    stack<int> stk;
    cin >> s;
    for(char c : s) { 
      if(c == '(') stk.push(c);
      else if (stk.empty() == true) { 
        cout << "NO" << '\n'; 
        needContinue = true; 
        break;
      } else { 
        stk.pop();
      }
    }
    if(needContinue) { 
      continue;
    }
    if(stk.empty()) { 
      cout << "YES" << '\n';
    } else { 
      cout << "NO" << '\n';
    }
  }
  return 0;
}

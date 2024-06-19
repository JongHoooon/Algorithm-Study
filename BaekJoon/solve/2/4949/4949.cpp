#include <iostream>
#include <stack>
#include <string>
using namespace std;

string s;

int main(void) { 
  while(true) { 
    getline(cin, s);
    bool isGood = true;
    if(s == ".") break;
    stack<char> stk;
    for(char c : s) { 
      if(c != '(' && c != ')' && c != '[' && c != ']') continue;
      if(c == '(' || c == '[') { 
        stk.push(c);
        continue;
      }
      if(stk.empty() == false) { 
        char top = stk.top();
        if(top == '(' && c != ')') { 
          isGood = false;
          break;  
        }
        if(top == '[' && c != ']') { 
          isGood = false;
          break;  
        }
        stk.pop();
      } else { 
        isGood = false;
        break;
      }
    }
    if(isGood == false || stk.empty() == false) { 
      cout << "no" << '\n';
    } else { 
      cout << "yes" << '\n';
    }
  }
  return 0;
}

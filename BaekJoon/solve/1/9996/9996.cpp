#include <iostream>

using namespace std;

int n;
string pattern, pre, suf;
string input;

int main(void) { 
  cin >> n;
  cin >> pattern;
  int pos = pattern.find('*');
  pre = pattern.substr(0, pos);
  suf = pattern.substr(pos + 1);
  
  for(int i = 0; i < n; i++) { 
    cin >> input;
    if(pre.size() + suf.size() > input.size()) { 
      cout << "NE" << '\n';
      continue;
    }

    if(input.substr(0, pre.size()) == pre && input.substr(input.size() - suf.size()) == suf) { 
      cout << "DA" << '\n';
    } else { 
      cout << "NE" << '\n';
    }
  }
  return 0;
}

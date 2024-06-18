#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int m;
string s;
vector<string> v;

void erase_zero(string& s) { 
  while(true) {
    if(s.size() != 0 && s.front() == '0') s.erase(s.begin());
    else break;
  }
  if(s.empty()) s = "0";
}

bool cmp(string a, string b) { 
  if(a.size() == b.size()) { 
    return a < b;
  } else { 
    return a.size() < b.size();
  }
}

int main(void) { 
  cin >> m;
  for(int i = 0; i < m; ++i) { 
    string temp = "";
    cin >> s;
    for(char c : s) { 
      if(int('0') <= int(c) && int(c) <= int('9')) { 
        temp += c;
      } else if(temp.empty() == false) { 
        erase_zero(temp);
        v.push_back(temp);
        temp = "";
      }
    }
    if(temp.empty() == false) { 
      erase_zero(temp);
      v.push_back(temp);
      temp = "";
    }
  }
  sort(v.begin(), v.end(), cmp);
  for(string n : v) { 
    cout << n << '\n';
  }
  return 0;
}
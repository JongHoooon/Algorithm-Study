#include <iostream>
#include <vector>
#include <algorithm>
#include <string>
using namespace std;
typedef long long ll;

vector<string> v;
int n;
string s;

void erase_zero(string& s) { 
  while(true) {
    if(s.size() && s.front() == '0') s.erase(s.begin());
    else break;
  }
  if(s.size() == 0) s = "0";
}

bool cmp(string a, string b) { 
  if(a.size() == b.size()) { 
    for(int i = 0; i < a.size(); ++i) { 
      if(a[i] != b[i]) { 
        return a[i] < b[i];
      }
    }
  }
  return a.size() < b.size();
}

int main(void) {
  cin >> n;
  for(int i = 0; i < n; ++i) { 
    cin >> s;
    string current = "";
    for(char c : s) { 
      if(int('0')  <= int(c) && int(c) <= int('9')) current += c;
      else if(current.empty() == false) { 
        erase_zero(current);
        v.push_back(current);
        current = "";
      }
    }
    if(current.empty() == false) {
      erase_zero(current);
      v.push_back(current);
      current = "";
    }
  }
  sort(v.begin(), v.end(), cmp);
  for(string n : v) { 
    cout << n << '\n';
  }
  return 0;
}

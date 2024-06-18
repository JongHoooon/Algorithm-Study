#include <iostream>
#include <map>
#include <vector>
#include <algorithm>
using namespace std;

int n, c, input;
vector<pair<int, int>> v;
map<int, int> m, m_first;

bool cmp(pair<int, int> a, pair<int, int> b) { 
  if(a.second == b.second) { 
    return m_first[a.first] < m_first[b.first];
  }
  return a.second > b.second;
}

int main(void) { 
  cin >> n >> c;
  for(int i = 0; i < n; ++i) { 
    cin >> input;
    ++m[input];
    if(m_first[input] == 0) m_first[input] = i + 1; 
  }
  for(auto it : m) { 
    v.push_back({it.first, it.second});
  }
  sort(v.begin(), v.end(), cmp);
  for(auto it : v) { 
    for(int i = 0; i < it.second; ++i) {
      cout << it.first << " ";
    }
  }
  cout << '\n';
  return 0;
}

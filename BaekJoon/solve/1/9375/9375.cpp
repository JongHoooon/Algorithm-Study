#include <iostream>
#include <unordered_map>
#include <vector>
using namespace std;

int n;
int cnt;
int answer = 1;
string clothes;
string type;
unordered_map<string, vector<string>> clothes_map;

int main(void) { 
  ios_base::sync_with_stdio(false);
  cin.tie(NULL); cout.tie(NULL);
  cin >> n;
  for(int i = 0; i < n; ++i) { 
    cin >> cnt;
    for(int j = 0; j < cnt; ++j) { 
      cin >> clothes >> type;
      clothes_map[type].push_back(clothes);
    }

    for(auto e: clothes_map) {
      answer *= e.second.size() + 1;
    }
    cout << answer - 1 << '\n';
    answer = 1;
    clothes_map = { };
  }  

  return 0;
}

#include <iostream>
#include <unordered_map>
#include <string>
#include <algorithm>

using namespace std;

int n;
unordered_map<char, int> cnt;
string answer;

int main(void) {
  cin >> n;
  for(int i = 0; i < n; i++) {
    string input;
    cin >> input;
    cnt[input[0]]++;
  }
  for(auto e : cnt) { 
    if(e.second >= 5) { 
      answer.push_back(e.first);
    }
  }
  sort(answer.begin(), answer.end());

  if(answer.empty()) { 
    cout << "PREDAJA";
  } else { 
    for(char c : answer) { 
      cout << c;
    }
  }
  
  return 0;
}
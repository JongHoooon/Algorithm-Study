#include<iostream>

using namespace std;

int n;
int cnt[26];
string input;
string answer;

int main(void) {
  cin >> n;
  for(int i = 0; i < n; ++i) { 
    cin >> input;
    cnt[input[0] - 'a']++;
  }

  for(int i; i < 26; ++i) { 
    if(cnt[i] >= 5) { 
      answer += i +'a';
    }
  }

  if(answer.empty()) { 
    cout << "PREDAJA";
  } else { 
    cout << answer;
  }

  return 0;
}
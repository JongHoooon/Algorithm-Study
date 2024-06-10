#include <iostream>
#include <unordered_map>
#include <algorithm>

using namespace std;

string name;
int n = int('Z') - int('A') + 1;
char char_arr[int('Z') - int('A') + 1];
bool is_possible = true;
string pre, middle, suf;

int main(void) { 
  ios_base::sync_with_stdio(false);
  cin.tie(NULL); cout.tie(NULL);

  cin >> name;
  for(char c : name) { 
    char_arr[int(c) - int('A')] += 1;
  }

  for(int i = 0; i < n; ++i) { 
    int count = char_arr[i];
    if(count == 0) continue;
    if(count % 2 == 1) { 
      if(is_possible == false) { 
        cout << "I'm Sorry Hansoo" << '\n';
        exit(0);
      }
      is_possible = false;

      middle = char(i + 'A');
    }
    for(int j = 0; j < count / 2; ++j) { 
        pre += char(i + 'A');
        suf += char(i + 'A');
      }
  }

  reverse(suf.begin(), suf.end());

  cout << pre << middle << suf << '\n';
  return 0;
}

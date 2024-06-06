#include <iostream>

using namespace std;

string str;
int answer[int('z') - int('a') + 1];

int main(void) { 
  cin >> str;
  for(char c : str) { 
    answer[c - 'a']++;
  }
  for(int n : answer) cout << n << " ";

  return 0;
}
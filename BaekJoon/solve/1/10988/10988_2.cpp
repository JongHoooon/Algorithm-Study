#include <iostream>
#include <algorithm>

using namespace std;

string s, temp;

int main(void) { 
  cin >> s;
  temp = s;
  reverse(temp.begin(), temp.end());
  if(temp == s) cout << 1;
  else cout << 0;
  return 0;
}
#include <iostream>
using namespace std;

int n, m, j, l, r, ret, input;

int main(void) {
  cin >> n >> m >> j;
  l = 1; 
  for(int i = 0; i < j; ++i) { 
    cin >> input;
    r = l + m - 1;
    if(input < l) { 
      ret += l - input;
      l -= l - input;
      continue;
    }
    if(input > r) { 
      ret += input - r;
      l += input - r;
      continue;
    }
  }
  cout << ret << '\n';
  return 0;
}

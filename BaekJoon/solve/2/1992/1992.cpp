#include<iostream>
#include<string>
using namespace std;

const int mn = 64;
int a[mn][mn], v[mn][mn];
int n, input;

string quad(int y, int x, int size) { 
  if(size == 1) return to_string(a[y][x]);
  int c = a[y][x];
  string ret = "";
  for(int i = y; i < y + size; ++i) { 
    for(int j = x; j < x + size; ++j) {
      if(c != a[i][j]) { 
        ret += "(";
        ret += quad(y, x, size / 2);
        ret += quad(y, x + size / 2, size / 2);
        ret += quad(y + size / 2, x, size / 2);
        ret += quad(y + size / 2, x + size / 2, size / 2);
        ret += ")";
        return ret;
      }
    }
  }
  return to_string(c);
}

int main(void) { 
  scanf("%d", &n);
  for(int y = 0; y < n; ++y) { 
    for(int x = 0; x < n; ++x) { 
      scanf("%1d", &a[y][x]);
    }
  }

  cout << quad(0, 0, n) << '\n';
  return 0;
}

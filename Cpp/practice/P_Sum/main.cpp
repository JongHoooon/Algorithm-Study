#include <iostream>

using namespace std;

int a[100004];
int b;
int c;
int psum[100004];
int n;
int m;

int main(void) { 
  cin >> n >> m;
  for(int i = 1; i <= n; ++i) { 
    cin >> a[i];
    psum[i] = psum[i - 1] + a[i];
  }
  for(int i = 0; i < m; ++i) { 
    cin >> b >> c;
    cout << psum[c] - psum[b - 1] << '\n';
  }
  return 0;
}

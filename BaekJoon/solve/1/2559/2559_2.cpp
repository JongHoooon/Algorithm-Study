#include <iostream>
#include <limits>

using namespace std;

int n, k;
int temp;
int psum[100001];
int ret = numeric_limits<int>::lowest();

int main(void) { 
  cin >> n >> k;
  for(int i = 1; i <= n; i++) { 
    cin >> temp;
    psum[i] = psum[i - 1] + temp;
  }
  for(int i = k; i <= n; i++) {
    ret = max(ret, psum[i] - psum[i - k]);
  }

  cout << ret << '\n';

  return 0;
}

#include<iostream>
using namespace std;
typedef long long ll;
ll a, b, c;

ll count(ll a, ll b) {
  if(b == 1) return a % c;
  ll ret = count(a, b / 2);
  ret = (ret * ret) % c;
  if(b % 2) ret = (ret * a) % c;
  return ret;
}

int main(void) { 
  ios_base::sync_with_stdio(false);
  cin.tie(NULL);
  cin >> a >> b >> c;
  cout << count(a, b) << '\n';
  return 0;
}
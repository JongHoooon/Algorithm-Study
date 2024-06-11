#include<iostream>
using namespace std;
typedef long long ll;

ll a, b, c;
ll compute(ll a, ll b) { 
  if(b == 1) return a % c;
  ll ret = compute(a, b / 2);
  ret = (ret * ret) % c;
  if(b % 2) ret = (ret * a) % c;
  return ret;
}

int main(void) { 
  ios_base::sync_with_stdio(false);
  cin.tie(NULL); cout.tie(NULL);
  cin >> a >> b >> c;
  cout << compute(a, b) << '\n';
  return 0;
}
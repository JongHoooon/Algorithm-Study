#include <iostream>

using namespace std;

int a;
int b;
int c;
int s;
int e;
int cnt[100];
int ret;

int main(void) { 
  cin >> a >> b >> c;
  for(int i = 0; i < 3; i++) { 
    cin >> s >> e;
    for(int j = s; j < e; j++) cnt[j]++;
  }

  for(int i = 1; i < 100; i++) { 
    if(cnt[i]) { 
      if(cnt[i] == 1) ret += a;
      else if(cnt[i] == 2) ret += b * 2;
      else if(cnt[i] == 3) ret += c * 3;
    }
  }
  cout << ret << '\n';
  return 0;
}
#include<iostream>
using namespace std;

int input;

int main(void) { 
  while(scanf("%d", &input) != EOF) { 
    int cnt = 1;
    long long n = 1;
    while(true) { 
      if(n % input == 0) {
        cout << cnt << '\n';
        break;
      } else { 
        n = n * 10 + 1;
        n %= input;
        ++cnt;
      }
    }
  }
  return 0;
}

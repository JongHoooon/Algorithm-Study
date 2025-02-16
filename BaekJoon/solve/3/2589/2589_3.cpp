#include <iostream>

using namespace std;

int r, c, a[50][50], visited[50][50];
string input;

int main(void) { 
  cin >> r >> c;
  for(int i = 0; i < r; ++i) { 
    cin >> input;
    for(char c : input) { 
      if(c == 'L') { 
        cout << "good" << endl;
      }
    }
  }
}

/*
L - 육지
W - 바다
- 한칸 이동 == 한 시간
- 
*/
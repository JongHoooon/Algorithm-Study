#include <iostream>
using namespace std;

const int max_n = 104;
int h, w;
bool a[max_n][max_n];
string s;

int main(void) { 
  cin >> h >> w;
  for(int i = 0; i < h; ++i) { 
    cin >> s;
    for(int j = 0; j < w; ++j) { 
      a[i][j] = s[j] == 'c';
    }
  } 

  for(int i = 0; i < h; ++i) { 
    int idx = -1;
    for(int j = 0; j < w; ++j) { 
      const char c = a[i][j];
      if(c == true) { 
        cout << 0 << " ";
        idx = j;
      } else { 
        if(idx == -1) { 
          cout << -1 << " ";
        } else { 
          cout << j - idx << " ";
        }
      }
    }
    cout << "\n";
  }

  return 0;
}

/*
H: 남북 1...100
W: 동서 1...100

구름은 1분이 지날 때마다 1킬로미터씩 동쪽으로 이동한다.
외부에서 구름이 오지는 않음
각 구역 언제 오는지..
*/
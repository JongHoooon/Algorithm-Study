#include <iostream>
#include <string>
using namespace std;

int n, w, s1, s2, t;
int t1, t2;
int current_win = 0;
string s;

int to_second(const string& s) { 
  const int min = stoi(s.substr(0, 2));
  const int sec = stoi(s.substr(3, 2));
  return min * 60 + sec;
}
 
int main(void) { 
  cin >> n;
  for(int i = 0; i < n; ++i) { 
    cin >> w >> s;
    int sec = to_second(s);
    if(w == 1) {  
      ++s1;
    } else  { 
      ++s2;
    }
    if(current_win != 0 && s1 == s2) {
      if(current_win == 1) { 
        t1 += sec - t;
      } else { 
        t2 += sec - t;
      }
      current_win = 0;
      continue;
    }

    if(s1 > s2 && current_win != 1) { 
      current_win = 1;
      t = sec;
    } else if((s2 > s1 && current_win != 2)) { 
      current_win = 2;
      t = sec;
    }
  }

  if(s1 > s2) { 
    t1 += 48 * 60 - t;
  } else if(s2 > s1) { 
    t2 += 48 * 60 - t;
  }

  printf("%02d:%02d\n", t1 / 60, t1 % 60);
  printf("%02d:%02d\n", t2 / 60, t2 % 60);
  return 0;
}


/*
n 1...100
들어간 시간, 팀(1, 2)
48분 게임 (0...47)
초(0...59)


이기고 있는 시간 출력
*/
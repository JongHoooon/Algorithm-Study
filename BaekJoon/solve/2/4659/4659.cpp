#include <iostream>
using namespace std;

string input;

bool isVowel(char c) { 
  return (c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u');
}

void isAvailable(string& s) { 
  const int n = s.size();
  bool c1 = false;
  bool c2 = true;
  bool c3 = true;
  int count_v = 0;
  int count_c = 0;
  char prev_c = '1';

  for(int i = 0; i < n; ++i) { 
    const char c = s[i];
    if(c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u') c1 = true;

    if(isVowel(c)) { 
      ++count_v;
      if(count_c != 0) count_c = 0;
    } else { 
      ++count_c;
      if(count_v != 0) count_v = 0;
    }
    if(count_c == 3 || count_v == 3) c2 = false;

    if(prev_c == c && c != 'e' && c != 'o') c3 = false;
    prev_c = c;
  }

  if(c1 && c2 && c3) { 
    printf("<%s> is acceptable.\n", s.c_str());
  } else { 
    printf("<%s> is not acceptable.\n", s.c_str());
  }
}

int main(void) { 
  while(true) { 
    cin >> input;
    if(input == "end") break;
    isAvailable(input);
  }

  return 0;
}
#include<iostream>
#include<vector>

using namespace std;

int N;
string input;
int cnt;
vector<char> st;

int main(void) { 
  ios_base::sync_with_stdio(false);
  cin.tie(NULL); cout.tie(NULL);

  cin >> N;
  for(int i = 0; i < N; ++i) {
    cin >> input;
    for(char c : input) { 
      if(st.empty()) {
        st.push_back(c);
        continue;
      }
      if(st.back() == c) {
        st.pop_back();
      } else { 
        st.push_back(c);
      }
    }

    if(st.empty()) { 
      ++cnt;
    }
    st = { };
  }

  cout << cnt << '\n';

  return 0;
}

/*
A: t
B: t

*/
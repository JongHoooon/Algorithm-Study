#include <iostream>
#include <algorithm>

using namespace std;

int a[9];
int cnt = 0;

int main(void) { 
  for(int i = 0; i < 9; ++i) { 
    cin >> a[i];
  }
  sort(a, a + 9);
  do { 
    // int sum = 0;
    // for(int i = 0; i < 7; ++i) sum += a[i];
    // if(sum == 100) break;
    // for(int n : a) cout << n << " ";
    // cout << "\n";
    cnt++;
  } while(next_permutation(a, a + 9));
  // for(int i = 0; i < 7; ++i) cout << a[i] << '\n';
  cout << cnt <<  endl;
  cout << 1*2*3*4*5*6*7*8*9 << endl;
  return 0;
}

// int main() {
//     ios_base::sync_with_stdio(false);
//     cin.tie(NULL);
//     cout.tie(NULL);
//     for(int i = 0; i < 9; i++){
//         cin >> a[i]; 
//     }
//     sort(a, a + 9);
//     do{
//         int sum = 0; 
//         for(int i = 0; i < 7; ++i) sum += a[i]; 
//         if(sum == 100)break;
//     }while(next_permutation(a, a + 9)); 
//     for(int i = 0; i < 7; i++) cout << a[i] << "\n"; 
//     return 0;
// }
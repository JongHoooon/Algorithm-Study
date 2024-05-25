#include <iostream>
#include <vector>

using namespace std;

// int main() {
//   int a[] = {1, 2, 3};
//   do {
//     for(int i : a ) cout << i << " ";
//     cout << '\n';
//   }while(next_permutation(&a[0], &a[0] + 3));
// }

// int main() {
//   int a[] = {1, 2, 3};
//   do {
//     for(int i : a ) cout << i << " ";
//     cout << '\n';
//   }while(prev_permutation(a, a + 3));
// }

// 순열 사용시 정렬 필수!
// int main() {
//   vector<int> a = {2, 1, 3, 100, 200};
//   sort(a.begin(), a.end());
//   do {
//     for(int i : a) cout << i << " ";
//     cout << '\n'; 
//   }while(next_permutation(a.begin(), a.end()));
// }

int main() {
  vector<int> a = {2, 1, 3, 100, 200};
  sort(a.begin(), a.end());
  do {
    for(int i = 0; i < 2; ++i) { 
      cout << a[i] << " ";
    }
    cout << "\n";
  }while(next_permutation(a.begin(), a.end()));
}

// n P r = n! / (n - r)!
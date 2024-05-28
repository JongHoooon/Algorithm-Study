#include <iostream>
#include <vector>
#include <string>
// #include <algorithm>

using namespace std;

// int main() { 
//   vector<int> vec = {10, 20, 30, 40, 50};
  // for(const int& value: vec) { 
  //   cout << value << "  ";
  // }
  // int test = 3;
  // cout << (double)test << endl;

  // double p = 1.0;
  // int a = (int) p * 100;
  // cout <<  typeid(a).name() << endl;
  // for(vector<int>::iterator it = vec.begin(); it != vec.end(); ++it) { 
  //   cout << *it << " ";
  // }
  // vector<int>::iterator it = vec.begin();
  // advance(it, 1);
  // cout << *it << endl;
  // int cnt = 0;
  // int a[5] = {1, 2, 3, 4, 5};
  // while(++cnt != 3) { 
  //   cout << cnt << endl;
  // }

//   vector<int> v {1, 2, 3};
//   vector<int> ret(v.size());
//   copy(v.begin(), v.end(), ret.begin());

//   for(int i : ret) { 
//     cout << &i << i << endl;
//   }

//   return 0;
// }

// int main() { 
//   vector<int> v = {1, 1, 1, 2, 3, 4, 1, 2, 3, 4};
//   sort(v.begin(), v.end());
//   v.erase(unique(v.begin(), v.end()), v.end());
//   for(int i : v) { 
//     cout << i << " ";
//   }
//   cout << "\n";
// }

// int main() {
//   double p = 1.5;
//   int a = (int) p * 100;
//   int b = (int) 100 * p;
//   cout << a << " : " << b << "\n";
//   cout << typeid(a).name() << " " << typeid(b).name() << endl;
//   cout << sizeof(a) << endl;
//   return 0;
// }

// #include <map>

// map<int, int> mp;
// int main(void) {
//   vector<int> v{1, 2, 4, 3, 2, 2, 1};
//   for(int i : v) { 
//     if(mp[i]) { 
//       continue;
//     } else { 
//       mp[i] = 1;
//     }
//   }
//   vector<int> result;
//   for(pair<int, int> it : mp) { 
//     result.push_back(it.first);
//   }
//   for(int i : result) { 
//     cout << i << endl;
//   }
// }

// int main(void) {
//   vector<int> a{1, 2, 3, 3, 3, 4};
//   cout << lower_bound(a.begin(), a.end(), 3) - a.begin() << endl;
//   cout << upper_bound(a.begin(), a.end(), 3) - a.begin() << endl;
// }

// vector<vector<int>> v;
// vector<vector<int>> v2(10, vector<int>(10, 1));
// vector<int> v3[10];

// int main(void) { 
//   cout << v2[0][0] << endl;
// }

// #include <map>

// map<string, string> mp;
// int main(void) {
//   if(mp.find("test") == mp.end()) { 
//     cout << "no" << endl;
//   }

//   for(auto it : mp) {
//     cout << it.first << endl;
//   }
// }

// int main(void) { 
//   vector<int> v {1, 2, 3};
//   cout << v.end() - v.begin() << endl;
// }

#include <stack>

int main() {
    // std::stack 선언
    std::stack<int> s;

    // 요소 추가
    s.push(10);
    s.push(20);
    s.push(30);

    // 스택의 크기 출력
    std::cout << "Stack size: " << s.size() << std::endl;

    // 스택의 맨 위 요소 출력
    std::cout << "Top element: " << s.top() << std::endl;

    // 스택의 맨 위 요소 제거
    s.pop();

    // 제거 후 스택의 맨 위 요소 출력
    std::cout << "Top element after pop: " << s.top() << std::endl;

    // 스택이 비어 있는지 확인
    if (s.empty()) {
        std::cout << "Stack is empty." << std::endl;
    } else {
        std::cout << "Stack is not empty." << std::endl;
    }
    return 0;
}
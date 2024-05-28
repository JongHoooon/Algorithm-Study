## 문자열 쪼개기 Split()

```cpp
#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector<string> split(const string& input, string separator) {
  size_t start = 0;
  size_t end = input.find(separator);
  vector<string> result;
  while(end != string::npos) { 
    result.push_back(input.substr(start, end - start));
    start = end + separator.size();
    end = input.find(separator, start);
  }
  result.push_back(input.substr(start));
  return result;
}
```

<br>

```cpp
#include <iostream>
#include <sstream>

using namespace std;

int main() {
  string str = "this is test case";
  string tmp;
  stringstream ss(str);

  while(getline(ss, tmp, ' ')) { 
    cout << tmp << endl;
  }
}
```

<br>

## 타입 최대값 / 최소값 확인

```cpp
#include <limits>
#include <iostream>
 
int main() 
{
    std::cout << "type\tlowest()\tmin()\t\tmax()\n\n"
              << "bool\t"
              << std::numeric_limits<bool>::lowest() << "\t\t"
              << std::numeric_limits<bool>::min() << "\t\t"
              << std::numeric_limits<bool>::max() << '\n'
              << "uchar\t"
              << +std::numeric_limits<unsigned char>::lowest() << "\t\t"
              << +std::numeric_limits<unsigned char>::min() << "\t\t"
              << +std::numeric_limits<unsigned char>::max() << '\n'
              << "int\t"
              << std::numeric_limits<int>::lowest() << '\t'
              << std::numeric_limits<int>::min() << '\t'
              << std::numeric_limits<int>::max() << '\n'
              << "float\t"
              << std::numeric_limits<float>::lowest() << '\t'
              << std::numeric_limits<float>::min() << '\t'
              << std::numeric_limits<float>::max() << '\n'
              << "double\t"
              << std::numeric_limits<double>::lowest() << '\t'
              << std::numeric_limits<double>::min() << '\t'
              << std::numeric_limits<double>::max() << '\n';
}
```

<br>

## type 확인, type 크기 확인

```cpp
#include <iostream>
#include <typeinfo>
using namespace std;

int main() {
	int a = 5;
	bool b = false;
	short int c = 15;
	double d = 25.12;

	cout << "a: " << a << ' ' << typeid(a).name() << ' ' << sizeof(int) << "바이트" << endl;
	cout << "b: " << b << ' ' << typeid(b).name() << ' ' << sizeof(bool) << "바이트" << endl;
	cout << "c: " << c << ' ' << typeid(c).name() << ' ' << sizeof(c) << "바이트" << endl;
	cout << "d: " << d << ' ' << typeid(d).name() << ' ' << sizeof(d) << "바이트" << endl;
	return 0;
}
```

## vector 중복 제거

```cpp
int main() { 
  vector<int> v = {1, 1, 1, 2, 3, 4, 1, 2, 3, 4};
  sort(v.begin(), v.end());
  v.erase(unique(v.begin(), v.end()), v.end());
  for(int i : v) { 
    cout << i << " ";
  }
  cout << "\n";
}
```

```cpp
#include <map>

map<int, int> mp;
int main(void) {
  vector<int> v{1, 2, 4, 3, 2, 2, 1};
  for(int i : v) { 
    if(mp[i]) { 
      continue;
    } else { 
      mp[i] = 1;
    }
  }
  vector<int> result;
  for(pair<int, int> it : mp) { 
    result.push_back(it.first);
  }
  for(int i : result) { 
    cout << i << endl;
  }
}
```

<br>

## 우선순위 큐

```cpp
#include <iostream>
#include <vector>
#include <queue>

using namespace std;
priority_queue<int, vector<int>, greater<int>> pq;  // 오름차순
priority_queue<int> pq2;                            // 내림차순
priority_queue<int, vector<int>, less<int>> pq3;    // 내림차순

int main(void) {
  for(int i = 5; i > 0; --i) {
    pq.push(i);
    pq2.push(i);
    pq3.push(i);
  }

  while(pq.size()) { 
    cout << pq.top() << ", " << pq2.top() << ", " << pq3.top() << endl;
    pq.pop();
    pq2.pop();
    pq3.pop();
  }
  return 0;
}
```

<br>

```cpp
#include <iostream>
#include <vector>
#include <queue>

using namespace std;

struct Point {
  int y;
  int x;
  Point(int y, int x): y(y), x(x) {}
  Point(): y(-1), x{-1} {}

  // 내림 차순 정렬
  // 커스텀 정렬은 반대!
  bool operator < (const Point & a) const { 
    return x < a.x;
  }
};

priority_queue<Point> pq;
int main() { 
  pq.push({1, 1});
  pq.push({2, 2});
  pq.push({3, 3});
  pq.push({4, 4});
  pq.push({5, 5});
  pq.push({6, 6});

  while(pq.size()) {
    cout << pq.top().x << " ";
    pq.pop();
  }
  cout << "\n";
  return 0;
}
```

<br>

```cpp
#include <iostream>
#include <queue>
#include <vector>

using namespace std;

struct Point {
  int y;
  int x;
};

struct cmp { 
  // 내림차순
  bool operator()(Point a, Point b) {
    return a.x < b.x;
  }
};

priority_queue<Point, vector<Point>, cmp> pq
int main(void) { 
  pq.push({1, 1});
  pq.push({2, 2});
  pq.push({3, 3});
  pq.push({4, 4});
  pq.push({5, 5});
  pq.push({6, 6})
  while(pq.size()) { 
    cout << pq.top().x << " ";
    pq.pop();
  }
 cout << "\n";
}
```

<br>

```cpp
struct cmp { 
  // 최소 힙
  bool operator()(const int& a, const int& b) { 
    return a > b;
  }
};

priority_queue<int, vector<int>, cmp> pq;

int main(void) { 
  for(int i = 0; i < 6; ++i) {
    pq.push(i);
  }
  cout << pq.top() << endl;
  return 0;
}
```

<br>

## 이차원 배열 회전
```cpp
#include <iostream>
#include <vector>

using namespace std;
const int n = 3;
const int m = 4;

void rotate_left_90(vector<vector<int>> &key) { 
  int n = key.size();
  int m = key[0].size();
  vector<vector<int>> temp(m, vector<int>(n, 0));

  for(int i = 0; i < m; ++i) {
    for(int j = 0; j < n; ++j) { 
      temp[i][j] = key[j][m - i - 1];
    }
  }
  key.resize(m);
  key[0].resize(n);
  key = temp;
  return;
}

void rotate_right_90(vector<vector<int>> &key) { 
  int n = key.size();
  int m = key[0].size();
  vector<vector<int>> temp(m, vector<int>(n, 0));
  for(int i = 0; i < m; ++i) { 
    for(int j = 0; j < n; ++i) { 
      temp[i][j] = key[n - j - 1][i];
    }
  }
  key.resize(m);
  key[0].resize(n);
  key = temp;
  return;
}

int main(void) { 
  vector<vector<int>> a = { 
    {1, 2, 3, 4},
    {5, 6, 7, 8},
    {9, 10, 11, 12}
  };
  rotate_left_90(a);
  for(int i = 0; i < a.size(); ++i) {
    for(int j = 0 ; j < a[0].size(); ++j) { 
      cout << a[i][j] << " ";
    }
    cout << "\n";
  }
}
```

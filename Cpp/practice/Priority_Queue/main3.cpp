#include <iostream>
#include <queue>
#include <vector>

using namespace std;

struct Point {
  int y;
  int x;
};

// struct cmp { 
//   // 내림차순
//   bool operator()(Point a, Point b) {
//     return a.x < b.x;
//   }
// };

// priority_queue<Point, vector<Point>, cmp> pq;

// int main(void) { 
//   pq.push({1, 1});
//   pq.push({2, 2});
//   pq.push({3, 3});
//   pq.push({4, 4});
//   pq.push({5, 5});
//   pq.push({6, 6});

//   while(pq.size()) { 
//     cout << pq.top().x << " ";
//     pq.pop();
//   }
//   cout << "\n";
// }

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
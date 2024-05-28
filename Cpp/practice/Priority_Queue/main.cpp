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

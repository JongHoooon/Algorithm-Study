## 문자열 쪼개기 Split()

```cpp
#include <iostream>
#include <string>
#include <vector>

using namespace std;

vector<string> split(string input, string separator) { 
  size_t position = 0;
  string token = "";
  vector<string> result;
  while((position = input.find(separator)) != string::npos) {
    token = input.substr(0, position);
    result.push_back(token);
    input.erase(0, position);
  }
  result.push_back(token);
  return result;
}
```
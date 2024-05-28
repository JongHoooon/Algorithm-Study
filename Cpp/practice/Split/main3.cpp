// #include <iostream>
// #include <string>
// #include <vector>

// using namespace std;

// vector<string> split(const string& input, string separator) {
//   size_t start = 0;
//   size_t end = input.find(separator);
//   vector<string> result;
//   while(end != string::npos) { 
//     result.push_back(input.substr(start, end - start));
//     start = end + separator.size();
//     end = input.find(separator, start);
//   }
//   result.push_back(input.substr(start));
//   return result;
// }

// int main() {
//   // string test = "test tes12t t333est";
//   // vector<string> splitted = split(test, " ");
//   // for(string s : splitted) { 
//   //   cout << s << endl;
//   // }
//   string test = "ㅁㅁ";
//   int test_int = atoi(test.c_str());
//   cout << test_int << endl;
// }

#include <iostream>
#include <limits>

using namespace std;

int main() {
  cout << numeric_limits<int>::max() << endl;
}

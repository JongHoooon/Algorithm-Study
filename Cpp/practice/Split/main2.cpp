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

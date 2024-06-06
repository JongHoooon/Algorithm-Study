#include <iostream>

using namespace std;

string input;
int result = 1;

int main(void) { 
  cin >> input;
  size_t size = input.size();

  for(int i = 0; i < size / 2; ++i) {
    if(input[i] != input[size - i - 1]) { 
      result = 0;
      break;
    }
  }
  
  cout << result;

  return 0;
}
#include<iostream>
#include<unordered_map>

using namespace std;

int n, m;
string input;

unordered_map<string, int> nameKeyMap;
string arr[100004];

int main(void) { 
  ios_base::sync_with_stdio(false);
	cin.tie(NULL); cout.tie(NULL);
  cin >> n >> m;
  for(int i = 1; i <= n; ++i) { 
    cin >> input;
    arr[i] = input;
    nameKeyMap[input] = i;
  }
  for(int i = 0; i < m; ++i) { 
    cin >> input;
    if(atoi(input.c_str())) { 
      cout << arr[atoi(input.c_str())] << '\n';
    } else { 
      cout << nameKeyMap[input] << '\n';
    }
  }
}


// #include<bits/stdc++.h>
// using namespace std;
// int n, m;
// string s; 
// map<string, int> mp;
// map<int, string> mp2;
// string a[100004];
// int main(){  
// 	ios_base::sync_with_stdio(false);
// 	cin.tie(NULL); cout.tie(NULL);
// 	cin >> n >> m; 
// 	for(int i = 0; i < n; i++){
// 		cin >> s; 
// 		mp[s] = i + 1;  
// 		mp2[i + 1] = s; 
//         a[i + 1] = s;
// 	}
// 	for(int i = 0; i < m; i++){
// 		cin >> s; 
// 		if(atoi(s.c_str()) == 0){
// 			cout << mp[s] << "\n";
// 		}else{
// 			cout << a[atoi(s.c_str())] << "\n"; 
// 			//cout << mp2[atoi(s.c_str())] << "\n"; 
// 		}
// 	} 
// }

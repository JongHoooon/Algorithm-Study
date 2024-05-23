#include <iostream>
#include <algorithm>
#include <vector>

using namespace std;

class Solution {
public:
    vector<vector<int>> merge(vector<vector<int>>& intervals) {
        sort(intervals.begin(), intervals.end());
        vector<vector<int>> output;
        for(vector<int> interval : intervals)
        {
          if(output.empty() == true)
          {
            output.push_back(interval);
            continue;
          }
          vector<int> last = output.back();
          if(interval[0] <= last[1] && interval[1] >= last[1])
          {
            * output.end() = {last[0], interval[1]};
          }
          else
          {
            output.push_back(interval);
          }
        }
    }
};

int main()
{
  return 0;
}
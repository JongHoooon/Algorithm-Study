from typing import List   

def longestCommonSubsequence(text1: str, text2: str) -> int:
  dp_table = [[0]*(len(text1)+1) for j in range(len(text2)+1)]
  
  for rowIdx in range(1,len(dp_table)):
    prev_row = rowIdx - 1
    char2 = text2[rowIdx-1]
    for colIdx in range(1,len(dp_table[rowIdx])):
      prev_col = colIdx-1
      char1 = text1[colIdx-1]
      
      dp = 0
      if char1 == char2:
        dp = dp_table[prev_row][prev_col] + 1
      else:
        dp = max(dp_table[prev_row][colIdx], dp_table[rowIdx][prev_col])        
      dp_table[rowIdx][colIdx] = dp
  return dp_table[-1][-1]  #return last dp table elem 

print(longestCommonSubsequence(text1='abdcg',text2='bdag'))
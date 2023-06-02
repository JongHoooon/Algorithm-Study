from typing import List

class ObjectVal:
  def __init__(self, weight:int, value:int):
    self.weight = weight
    self.value = value

class KnapSack:
  def __init__(self, objects:List[ObjectVal]):
    self._objects = objects

  def _initDPTable(self,object_count:int, weight_limit:int):
    #init dp table
    self._dp = [[None for i in range(weight_limit+1)] for j in range(object_count+1)]
    for rowIdx in range(len(self._dp)):
      self._dp[rowIdx][0] = 0

    for colIdx in range(weight_limit+1):      
      self._dp[0][colIdx] = 0 

  def topDown(self, weight_limit:int) -> int:
    obj_endIdx = len(self._objects)
    self._initDPTable(obj_endIdx,weight_limit)    
    max_val = self._recurTopDown(obj_endIdx,weight_limit)
    return max_val    

  def _recurTopDown(self,object_idx:int,weight_limit:int) -> int:
    if object_idx < 0 or weight_limit < 0:
      return 0
    dp_val = self._dp[object_idx][weight_limit]
    if dp_val is None:
      prev_obj_idx = object_idx - 1
      not_taking_val = self._recurTopDown(prev_obj_idx,weight_limit)

      weight = self._objects[object_idx-1].weight
      value = self._objects[object_idx-1].value
      taking_val = self._recurTopDown(prev_obj_idx,weight_limit-weight)+value

      max_value = max(not_taking_val,taking_val)
      self._dp[object_idx][weight_limit] = max_value
      return max_value
    return dp_val    
    

  def bottomUp(self, weight_limit:int) -> int:
    obj_endIdx = len(self._objects)
    self._initDPTable(obj_endIdx,weight_limit)

    for rowIdx in range(1,len(self._dp)):
      for colIdx in range(1,weight_limit+1):      
        prev_obj_idx = rowIdx - 1
        not_taking_val = self._dp[prev_obj_idx][colIdx]
        
        weight = self._objects[rowIdx-1].weight
        value = self._objects[rowIdx-1].value
        
        taking_val = 0
        prev_weight_limit = colIdx-weight
        if prev_weight_limit<0:
          taking_val = 0
        else:
          taking_val = self._dp[prev_obj_idx][prev_weight_limit] + value

        max_val = max(not_taking_val,taking_val)
        self._dp[rowIdx][colIdx] = max_val

    return self._dp[obj_endIdx][weight_limit]     

objects = [ObjectVal(1,30),ObjectVal(2,20),ObjectVal(3,40),ObjectVal(4,10)]
knapSack = KnapSack(objects)
print(knapSack.topDown(5))
print(knapSack.bottomUp(5))
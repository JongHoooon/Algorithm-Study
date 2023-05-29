
import sys
from heapq import heappush, heappop
input = sys.stdin.readline

N = int(input())
heap = []

for _ in range(N):
    heappush(heap, int(input()))
    
answer = 0

while len(heap) > 1: 
    sum = heappop(heap) + heappop(heap)
    heappush(heap, sum)
    answer += sum
    
print(answer)
    
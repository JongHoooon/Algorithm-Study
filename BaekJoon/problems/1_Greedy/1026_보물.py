n = int(input())
array_a = list(map(int, input().split()))
array_b = list(map(int, input().split()))

answer = 0
for i in range(n):
    answer += min(array_a) * max(array_b)
    array_a.pop(array_a.index(min(array_a)))
    array_b.pop(array_b.index(max(array_b)))
    
print(answer)

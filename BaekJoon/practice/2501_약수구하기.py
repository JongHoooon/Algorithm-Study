
N, K = map(int, input().split())

divisors: list[int] = []

for i in range(1, N+1):
    if N % i == 0:
        divisors.append(i)
        
if len(divisors) < K:
    print(0)
else:
    print(divisors[K-1])

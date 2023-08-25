from sys import stdin
_ = stdin.readline()
N = sorted(map(int, stdin.readline().split()))
_ = stdin.readline()
M = map(int, stdin.readline().split())

def binarySearch(n, N, start, end):
    if start > end:
        return 0
    
    m = (start + end) // 2
    if n == N[m]:
        return N[start:].count(n)
    elif n < N[m]:
        return binarySearch(n, N, start, m-1)
    else:
        return binarySearch(n, N, m+1, end)
    
n_dict = {}
for n in N:
    start = 0
    end = len(N)-1
    if n not in n_dict:
        n_dict[n] = binarySearch(n, N, start, end)
    
for m in M:
    if m in n_dict:
        print(n_dict[m], end=" ")
    else:
        print(0, end=" ")
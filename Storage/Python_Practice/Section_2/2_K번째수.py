
T = int(input())

for _ in range(T):
    N, s, e, k = map(int, input().split())
    num_list = list(map(int, input().split()))

    print(sorted(num_list[s-1:e])[k-1])


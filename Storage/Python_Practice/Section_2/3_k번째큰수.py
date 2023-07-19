
N, K = map(int, input().split())
num_list = list(set(map(int, input().split())))
num_list.sort(reverse=True)

print(num_list[K-1])
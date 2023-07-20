
N, M = map(int, input().split())

count_list = [0 for _ in range(0, N+M+1)]

for i in range(1, N+1):
    for j in range(1, M+1):
        count_list[i+j] += 1

answer_list = []
max_count = -1

for i, count in enumerate(count_list):
    if count > max_count: 
        answer_list = [i]
        max_count = count    
    elif count == max_count:
        answer_list.append(i)

print(answer_list)

for answer in answer_list:
    print(answer, end=" ")
    
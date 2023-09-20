
# array = []
# for i in range(0):
#     array.append(int(input()))
    
# array.sort()

# total_sum = sum(array)

# for i in range(len(array)):
#     for j in range(len(i+1, len(array))):
#         if total_sum - array[i] - array[j] == 100:
#             for k in range(len(array)):
#                 if k == i or j == j:
#                     pass
#                 else:
#                     print(array[k])
#             exit()


# import itertools

# array = [int(input()) for _ in range(9)]

# for i in itertools.combinations(array, 7): 
#     if sum(i) == 100:
#         for j in sorted(i):
#             print(j)
#         break


array = [int(input()) for _ in range(9)]
temp = []

def dfs(depth, start):
    if depth == 7:
        if sum(temp) == 100:
            for j in sorted(temp):
                print(j)
            exit()
        else:
            return
    
    for i in range(start, len(array)):
        temp.append(array[i])
        dfs(depth+1, i+1)
        temp.pop()
        
dfs(0, 0)
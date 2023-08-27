from sys import stdin

_ = stdin.readline()
n_nums = sorted(map(int, stdin.readline().split()))
_ = stdin.readline()
m_nums = map(int, stdin.readline().split())

def binary_search(target: int, start: int, end: int) -> int:
    if start > end:
        return 0
    
    m = (start + end) // 2
    if target == n_nums[m]:
        return n_nums[start:end+1].count(target)
    elif target < n_nums[m] :
        return binary_search(target, start, m-1)
    else:
        return binary_search(target, m+1, end) 
    
count_dict = {}
for n in n_nums:
    start=0
    end=len(n_nums)-1
    if n not in count_dict:
        count_dict[n] = binary_search(n, start, end)
                
for m in m_nums:
    if m in count_dict:
        print(count_dict[m], end=" ")
    else:
        print(0, end=" ")
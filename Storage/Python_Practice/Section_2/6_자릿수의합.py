
N = int(input())
nums = map(int, input().split())

def digit_sum(x: int) -> int:    
    num_str = str(x)
    sum = 0
    
    for n in num_str:
        sum += int(n)
        
    return sum

max_sum = -1
max_num = 0

for num in nums: 
    sum = digit_sum(num)
    
    if sum > max_sum:
        max_sum = sum
        max_num = num

print(max_num)


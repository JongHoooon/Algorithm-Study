"""
def solution(sequence, k):
    answer = [0, len(sequence)-1]
    idx_start = 0
    idx_end = 0
    sum = 0
    
    for (i, n) in enumerate(sequence):
        
        sum += n
        idx_end = i
        
        if sum == k and idx_end - idx_start < answer[1] - answer[0]:
            answer[0] = idx_start
            answer[1] = idx_end
        elif sum > k:
            while sum > k:
                sum -= sequence[idx_start]
                idx_start += 1
            if sum == k and idx_end - idx_start < answer[1] - answer[0]:
                answer[0] = idx_start
                answer[1] = idx_end
            
    return answer
"""

def solution(sequence, k):    
    answer = []
    sum = 0
    l = 0
    r = 0
    
    for (i, n) in enumerate(sequence):
        r = i
        sum += n
        while sum > k and l <= r : 
            sum -= sequence[l]
            l += 1        
        if sum == k:
            answer.append([l, r])
                
    answer.sort(key=lambda x: (x[1]-x[0], x[0]))
    
    return answer[0]

print(solution([1, 1, 1, 2, 3, 4, 5], 5))
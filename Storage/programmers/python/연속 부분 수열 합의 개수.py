def solution(elements):
    l = len(elements)
    result = set(elements)
    
    for i, e in enumerate(elements):
        sum = e
        for j in range(i+1, i+l):
            sum += elements[j%l]
            result.add(sum)
    return len(result)


print(solution([7, 9, 1, 1, 4]))
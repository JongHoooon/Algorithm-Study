import sys

N = int(input())
score_list = list(map(int, input().split()))

average = round(sum(score_list) / N)

answer_idx = 0
score_record = 0
gap_record = sys.maxsize

for i, score in enumerate(score_list):
    gap = abs(score-average)
    if gap < gap_record:
        answer_idx = i
        score_record = score
        gap_record = gap
        
    if gap == gap_record and score_record < score:
        answer_idx = i
        score_record = score
        
print(average, answer_idx+1)

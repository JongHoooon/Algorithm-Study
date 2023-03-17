e, s, m = map(int, input().split())
answer = 0

if e == 15: e = 0
if s == 28: s = 0
if m == 19: m = 0

while True:
    answer += 1
    if answer % 15 == e:
        if answer % 28 == s:
            if answer % 19 == m:
                print(answer)
                break
    
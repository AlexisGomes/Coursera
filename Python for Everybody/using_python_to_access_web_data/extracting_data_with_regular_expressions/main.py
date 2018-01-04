import re

handle = open("regex_sum.txt")

total = 0
for line in handle:

    res = re.findall("[0-9]+", line)

    if res is None or len(res) <= 0:
        continue

    for i in res:
        total += int(i)

print(total)

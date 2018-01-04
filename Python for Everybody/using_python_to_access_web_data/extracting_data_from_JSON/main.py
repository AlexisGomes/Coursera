import urllib.request, urllib.parse, urllib.error
import json

#sample data (Sum=2553)
#url = "http://py4e-data.dr-chuck.net/comments_42.json"

#Test data (Sum ends with 78)
url = "http://py4e-data.dr-chuck.net/comments_44041.json"

uh = urllib.request.urlopen(url)
data = uh.read()
items = json.loads(data)

sum = 0
for item in items["comments"]:
    print(item)
    sum = sum + int(item["count"])

print(sum)
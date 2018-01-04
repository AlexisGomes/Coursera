import urllib.request, urllib.parse, urllib.error
import xml.etree.ElementTree as ET

#sample data (Sum=2553)
#url = "http://py4e-data.dr-chuck.net/comments_42.xml"

#Test data (Sum ends with 62)
url = "http://py4e-data.dr-chuck.net/comments_44040.xml"

print('Retrieving', url)
uh = urllib.request.urlopen(url)
data = uh.read()
print('Retrieved', len(data), 'characters')
print(data.decode())
tree = ET.fromstring(data)

#tags = tree.findall('comments/comment')
#tags = tree.findall('comments/comment/count')
tags = tree.findall('.//count')
sum = 0
for tag in tags:
    print(tag)
    sum = sum + int(tag.text)


print(sum)
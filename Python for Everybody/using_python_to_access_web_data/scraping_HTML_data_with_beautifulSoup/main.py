import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup

#sample file sum=2553
#url = "http://py4e-data.dr-chuck.net/comments_42.html"

#testing file
url = "http://py4e-data.dr-chuck.net/comments_44038.html"

html = urllib.request.urlopen(url).read()

soup = BeautifulSoup(html, "html.parser")
tags = soup('span')

total = 0
for tag in tags:
    total += int(tag.contents[0])

print(total)

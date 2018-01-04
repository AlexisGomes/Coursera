import urllib.request, urllib.parse, urllib.error
from bs4 import BeautifulSoup

#sample file answer=Fikret Montgomery Mhairade Butchi Anayah
#url = "http://py4e-data.dr-chuck.net/known_by_Fikret.html"

#testing file
url = "http://py4e-data.dr-chuck.net/known_by_Eoin.html"

html = urllib.request.urlopen(url).read()

soup = BeautifulSoup(html, "html.parser")
tags = soup('a')

res = "Fikret "

for i in range(7):
    res += tags[17].contents[0] + " "
    print(tags[17].contents[0])
    print(tags[17].get("href", None))

    url = tags[17].get("href", None)
    if url is not None:
        html = urllib.request.urlopen(url).read()
        soup = BeautifulSoup(html, "html.parser")
        tags = soup('a')

print(res)

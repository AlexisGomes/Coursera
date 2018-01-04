import urllib.request, urllib.parse, urllib.error
import json

url = "http://py4e-data.dr-chuck.net/geojson?"

# South Federal University -> place_id = "ChIJJ8oO7_B_bIcR2AlhC8nKlok"
url = url + urllib.parse.urlencode({'address': "University of Malaya"})
uh = urllib.request.urlopen(url)
data = uh.read()
jsonObj = json.loads(data)

print(jsonObj)
print(jsonObj['results'][0]['place_id'])
from bs4 import BeautifulSoup

html = open("init-companies.html", "r")

raw = BeautifulSoup(html)

data = {t.string.encode("ascii"):t.get("href").encode("ascii") for t in raw.findAll("a")}

print(data)

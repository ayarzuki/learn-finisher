require "json"

json = JSON.parse(content)

products = json["results"][0]["hits"]

p products.size
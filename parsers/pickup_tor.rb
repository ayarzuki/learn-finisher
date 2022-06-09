json = JSON.parse(content)

### Temporary initialize an empty hash for item
item = {}
item["_collection"] = "items"

identifier_sku = page["vars"]["identifier_sku"]
delivery_details = page["vars"]["delivery_details"]
in_stock_online = page["vars"]["in_stock_online"]
store = page["vars"]["store"]

### Temporary vars script
brand = page["vars"]["brand"]
category = page["vars"]["category"]
colour = page["vars"]["colour"]
description = page["vars"]["description"]
features = page["vars"]["features"]
model_number = page["vars"]["model_number"]
price_now = page["vars"]["price_now"]
price_was = page["vars"]["price_was"]
product_name = page["vars"]["product_name"]
product_rating = page["vars"]["product_rating"]
review_count = page["vars"]["review_count"]
scrape_datetime = page["vars"]["scrape_datetime"]
size = page["vars"]["size"]
url = page["vars"]["url"]
warranty_info = page["vars"]["warranty_info"]
weight = page["vars"]["weight"]

store_quantity = json["availability"][identifier_sku]["234"]["availableqty"] rescue nil
if store_quantity == nil
    in_stock_instore = "no"
    store_stock = ""
    online_only = "yes"
elsif store_quantity > 0
    in_stock_instore = "yes"
    store_stock = store_quantity
    online_only = "no"
else
    in_stock_instore = "no"
    store_stock = ""
    online_only = "yes"
end

item["delivery_details"] = delivery_details
item["in_stock_online"] = in_stock_online
item["store"] = store
item["in_stock_instore"] = in_stock_instore
item["store_stock"] = store_stock
item["online_only"] = online_only

### Temporary item output
item["brand"] = brand
item["category"] = category
item["colour"] = colour
item["description"] = description
item["features"] = features
item["model_number"] = model_number
item["price_now"] = price_now
item["price_was"] = price_was
item["product_name"] = product_name
item["product_rating"] = product_rating
item["review_count"] = review_count
item["scrape_datetime"] = scrape_datetime
item["size"] = size
item["url"] = url
item["warranty_info"] = warranty_info
item["weight"] = weight

outputs << item

# pages << {
#     page_type: "pickup_van",
#     vars: {
#         item: item
#     }
# }

# outputs << {
#     _collection: "stock_tor",
#     identifier_sku: identifier_sku,
#     delivery_details: delivery_details,
#     in_stock_online: in_stock_online,
#     store: store,
#     in_stock_instore: in_stock_instore,
#     store_stock: store_stock,
#     online_only: online_only
# }
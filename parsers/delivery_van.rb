json = JSON.parse(content)

identifier_sku = page["vars"]["identifier_sku"]

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

online_stock = json["availability"][0]["available_quantity"]

if online_stock > 0
    delivery_by = "Delivered by:" + json["availability"][0]["min_delivery_date"] + " - " + json["availability"][0]["max_delivery_date"] rescue ""
    delivery_details = delivery_by + "Delivery to: M5C 1S8Shipping cost: FREE"
    in_stock_online = "yes"
else
    delivery_details = ""
    in_stock_online = "no"
end

# pages << {
#     url: "https://inventory-api-staples-amigos.boldapps.net/v1/inventory/request",
#     method: "POST",
#     page_type: "pickup_van",
#     headers: {
#         "Accept" => "application/json, text/plain, */*",
#         "Accept-Encoding" => "gzip, deflate, br",
#         "Accept-Language" => "en-US,en;q=0.5",
#         "Connection" => "keep-alive",
#         "Content-Type" => "application/json",
#         "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"
#     },
#     body: '{"locale":"en-CA","store_number":"254","postal_code":"V6E 3P3","items":[{"sku":"' + identifier_sku.to_s + '","quantity":1000}],"location":"PickInStore"}',
#     vars: {
#         identifier_sku: identifier_sku,
#         delivery_details: delivery_details,
#         in_stock_online: in_stock_online,
#         store: "1055 West Georgia Street, Suite 220, Vancouver, BC, V6E 3P3",
#     }
# }

### Temporary pages
pages << {
    url: "https://inventory-api-staples-amigos.boldapps.net/v1/inventory/request",
    method: "POST",
    page_type: "pickup_van",
    headers: {
        "Accept" => "application/json, text/plain, */*",
        "Accept-Encoding" => "gzip, deflate, br",
        "Accept-Language" => "en-US,en;q=0.5",
        "Connection" => "keep-alive",
        "Content-Type" => "application/json",
        "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"
    },
    body: '"locale":"en-CA","store_number":"254","postal_code":"V6E 3P3","items":[{"sku":"' + identifier_sku.to_s + '","quantity":1000}],"location":"PickInStore"}',
    vars: {
        identifier_sku: identifier_sku,
        delivery_details: delivery_details,
        in_stock_online: in_stock_online,
        store: "1055 West Georgia Street, Suite 220, Vancouver, BC, V6E 3P3",
        brand: brand,
        category: category,
        colour: colour,
        description: description,
        features: features,
        model_number: model_number,
        price_now: price_now,
        price_was: price_was,
        product_name: product_name,
        product_rating: product_rating,
        review_count: review_count,
        scrape_datetime: scrape_datetime,
        size: size,
        url: url,
        warranty_info: warranty_info,
        weight: weight
    }
}
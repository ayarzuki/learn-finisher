json = JSON.parse(content)

identifier_sku = page["vars"]["identifier_sku"]

online_stock = json["availability"][0]["available_quantity"]

if online_stock > 0
    delivery_by = "Delivered by:" + json["availability"][0]["min_delivery_date"] + " - " + json["availability"][0]["max_delivery_date"] rescue ""
    delivery_details = delivery_by + "Delivery to: M5C 1S8Shipping cost: FREE"
    in_stock_online = "yes"
else
    delivery_details = ""
    in_stock_online = "no"
end

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
    body: '{"locale":"en-CA","store_number":"254","postal_code":"V6E 3P3","items":[{"sku":"' + identifier_sku.to_s + '","quantity":1000}],"location":"PickInStore"}',
    vars: {
        identifier_sku: identifier_sku,
        delivery_details: delivery_details,
        in_stock_online: in_stock_online,
        store: "1055 West Georgia Street, Suite 220, Vancouver, BC, V6E 3P3",
    }
}
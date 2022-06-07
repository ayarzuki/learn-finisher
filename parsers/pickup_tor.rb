json = JSON.parse(content)

identifier_sku = page["vars"]["identifier_sku"]
delivery_details = page["vars"]["delivery_details"]
in_stock_online = page["vars"]["in_stock_online"]
store = page["vars"]["store"]

store_quantity = json["availability"][identifier_sku]["234"]["availableqty"]
if store_quantity > 0
    in_stock_instore = "yes"
    store_stock = store_quantity
    online_only = "no"
else
    in_stock_instore = "no"
    store_stock = ""
    online_only = "yes"
end

outputs << {
    _collection: "stock_tor",
    identifier_sku: identifier_sku,
    delivery_details: delivery_details,
    in_stock_online: in_stock_online,
    store: store,
    in_stock_instore: in_stock_instore,
    store_stock: store_stock,
    online_only: online_only
}
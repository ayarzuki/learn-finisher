require "json"

json = JSON.parse(content)

products = json["results"][0]["hits"]

total_page_products = products.size



products.each do |product|
    # initialize an empty hash
    item = {}
    
    ### Extract Product Name
    item["product_name"] = product["title"]

    ### Extract Brand
    item["brand"] = product["named_tags"]["brand"] rescue nil
    
    ### Extract Collection
    item["_collection"] = "items"

    ### Extract Description
    desc_upside = product["body_html"] rescue ""
    desc_downside = product["meta"]["props"]["bullets"] rescue ""
    item["description"] = desc_upside + " "+ desc_downside rescue ""
    
    ### Extract Price Now
    price_now = product["price"]
    item["price_now"] = price_now rescue nil

    ### Extract Price Was
    item["price_was"] = ""

    ### Extract Category
    category_1 = product["named_tags"]["bc_l1_name"]
    category_2 = product["named_tags"]["bc_l2_name"]
    category_3 = product["named_tags"]["bc_l3_name"]
    item["category"] = "Home > " + category_1 + " > " + category_2 + " > " + category_3 rescue nil

    ### Extract Colour
    item["colour"] = ""

    ### Extract Delivery Details
    item["delivery_details"] = ""

    ### Extract Features
    features_parse = product["meta"]["props"]["specifications"] rescue ""
    features_parse = features_parse.gsub(/[\{}\\\"\_]/, " ").gsub(/(en\sCA\s:\s+)/, "").gsub(/(\s+\,\sfr\sCA.*)/, "").strip.gsub(/(\s\d+\s)/, '') rescue ""
    features = features_parse.split(" ,").join(",")
    item["features"] = features rescue ""

    ### Extract Identifier SKU
    sku = product["sku"]
    item["identifier_sku"] = sku rescue ""

    ### Extract In Stock Instore
    # instock_instore = 

    ### Extract In Stock Online
    # instock_online = product["in_stock"]
    
    ### Extract Model Number
    model_number = product["_highlightResult"]["named_tags"]["model_num"]["value"]
    item["model_number"] = model_number rescue ""

    ### Extract Product Rating
    product_rating = product["named_tags"]["AverageOverallRating"] rescue ""
    item["product_rating"] = product_rating rescue ""

    ### Extract Review Count
    review_count = product["named_tags"]["TotalSubmittedReviews"] rescue ""
    item["review_count"] = review_count rescue ""

    ### Extract Colour
    colour_parse = features.scan(/([cC]olour.*[a-z\-]\,)/).join rescue ""
    colour = colour_parse.gsub(/([cC]olour)(.*\:\s)([a-zA-Z\-]+)(\,)/, '\3') rescue ""
    item["colour"] = colour rescue ""

    ### Extract Size
    parse_size = features_parse
    # p parse_size

    ### Extract Warranty Info
    item["warranty_info"] = ""

    ### Extract Weight
    item["weight"] = ""

    ### Scrape datetime
    item["scrape_datetime"] = Time.now.strftime("%FT%R:%SZ")

    ### Store
    # item["store"] = "85-89 Yonge Street, Toronto, ONm M5C 1S8"

    ### Extract URL
    query_product = product["handle"]
    item["url"] = "https://www.staples.ca/products/" + query_product rescue nil

    pages << {
        url: "https://inventory-api-staples-amigos.boldapps.net/v1/inventory/request",
        method: "POST",
        page_type: "delivery_tor",
        headers: {
            "Accept" => "application/json, text/plain, */*",
            "Accept-Encoding" => "gzip, deflate, br",
            "Accept-Language" => "en-US,en;q=0.5",
            "Connection" => "keep-alive",
            "Content-Type" => "application/json",
            "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"
        },
        body: '{"locale":"en-CA","postal_code":"M5C 1S8","items":[{"sku":"' + sku.to_s + '","quantity":1000}],"location":"M5C 1S8"}',
        vars: {
            identifier_sku: sku,
        }
    }

    pages << {
        url: "https://inventory-api-staples-amigos.boldapps.net/v1/inventory/request",
        method: "POST",
        page_type: "delivery_van",
        headers: {
            "Accept" => "application/json, text/plain, */*",
            "Accept-Encoding" => "gzip, deflate, br",
            "Accept-Language" => "en-US,en;q=0.5",
            "Connection" => "keep-alive",
            "Content-Type" => "application/json",
            "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"
        },
        body: '{"locale":"en-CA","postal_code":"V6E 3P3","items":[{"sku":"' + sku.to_s + '","quantity":1000}],"location":"V6E 3P3"}',
        vars: {
            identifier_sku: sku,
        }
    }

    outputs << item

end

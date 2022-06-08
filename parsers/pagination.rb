require "json"

json = JSON.parse(content)

products = json["results"][0]["hits"]

total_page_products = products.size

products.each do |product|
    # initialize an empty hash
    # item = {}
    
    ### Extract Product Name
    # item["product_name"] = product["title"]
    product_name = product["title"]

    ### Extract Brand
    # item["brand"] = product["named_tags"]["brand"] rescue nil
    brand = product["named_tags"]["brand"] rescue nil
    
    ### Extract Collection
    # item["_collection"] = "items"

    ### Extract Description
    desc_upside = product["body_html"] rescue ""
    desc_downside = product["meta"]["props"]["bullets"] rescue ""
    # item["description"] = desc_upside + " "+ desc_downside rescue ""
    description = desc_upside + " "+ desc_downside rescue ""
    
    ### Extract Price Now
    price_now = product["price"] rescue ""
    # item["price_now"] = price_now rescue ""

    ### Extract Price Was
    # item["price_was"] = ""
    price_was = ""

    ### Extract Category
    category_1 = product["named_tags"]["bc_l1_name"]
    category_2 = product["named_tags"]["bc_l2_name"]
    category_3 = product["named_tags"]["bc_l3_name"]
    # item["category"] = "Home > " + category_1 + " > " + category_2 + " > " + category_3 rescue nil
    category = "Home > " + category_1 + " > " + category_2 + " > " + category_3 rescue ""

    ### Extract Delivery Details

    ### Extract Features
    features_parse_json = product["meta"]["props"]["specifications"] rescue ""
    features_parse = features_parse_json.gsub(/[\{}\\\"\_]/, " ").gsub(/(en\sCA\s:\s+)/, "").gsub(/(\s+\,\sfr\sCA.*)/, "").strip.gsub(/(\s\d+\s\:)/, ':') rescue ""
    features = features_parse.split(" ,").join(",") rescue ""
    # item["features"] = features rescue ""

    ### Extract Identifier SKU
    sku = product["sku"] rescue ""
    # item["identifier_sku"] = sku rescue ""
    identifier_sku = sku rescue ""

    ### Extract In Stock Instore
    # instock_instore = 

    ### Extract In Stock Online
    # instock_online = product["in_stock"]
    
    ### Extract Model Number
    model_number = product["_highlightResult"]["named_tags"]["model_num"]["value"] rescue ""
    # item["model_number"] = model_number rescue ""

    ### Extract Product Rating
    product_rating = product["named_tags"]["AverageOverallRating"] rescue ""
    # item["product_rating"] = product_rating rescue ""

    ### Extract Review Count
    review_count = product["named_tags"]["TotalSubmittedReviews"] rescue ""
    # item["review_count"] = review_count rescue ""

    ### Extract Colour
    colour_parse = features.scan(/([cC]olour\s)([a-zA-Z]+\:)([\sa-zA-Z]+)(\,)/).join rescue ""
    colour = colour_parse.gsub(/([cC]olour\s)([a-zA-Z]+\:)([\sa-zA-Z]+)(\,)/, '\3') rescue ""
    # item["colour"] = colour.strip rescue ""
    colour = colour.strip rescue ""

    ### Extract Size
    parse_size1 = features_parse_json.gsub(/[\{}\\\"\_]/, " ").gsub(/(en\sCA\s:\s+)/, "").gsub(/(\s+\,\sfr\sCA.*)/, "") rescue ""
    parse_size = parse_size1.strip.gsub(/(\s\d+\s\:)/, ':') rescue ""
    size_parse = parse_size.scan(/([dD]imensions:)(.*\s)(\s+\,)/).join rescue ""
    size = size_parse.gsub(/([dD]imensions:)(\s[0-9\s+x\.\']+)(\,)/, '\2') rescue ""
    # item["size"] = size rescue ""

    # p parse_size

    ### Extract Warranty Info
    warranty = features_parse_json.gsub(/[\{}\\\"\_]/, " ").gsub(/(en\sCA\s:\s+)/, "").gsub(/(\s+\,\sfr\sCA.*)/, "") rescue ""
    warranty = warranty.strip.gsub(/(\s\d+\s\:)/, ':') rescue ""
    warranty_info = warranty.scan(/([wW]arranty:)(\s[0-9a-zA-Z\-\(\)\,.*\s+]+)(\,)/).join rescue ""
    # item["warranty_info"] = warranty_info.gsub(/([wW]arranty:)(\s[0-9a-zA-Z\-\(\)\,.*\s+]+)(\,)/, '\2').strip rescue ""
    warranty_info = warranty_info.gsub(/([wW]arranty:)(\s[0-9a-zA-Z\-\(\)\,.*\s+]+)(\,)/, '\2').strip rescue ""

    ### Extract Weight
    weight_parse = features_parse_json.gsub(/[\{}\\\"\_]/, " ").gsub(/(en\sCA\s:\s+)/, "").gsub(/(\s+\,\sfr\sCA.*)/, "") rescue ""
    weight_parse = weight_parse.strip.gsub(/(\s\d+\s\:)/, ':') rescue ""
    weight = weight_parse.scan(/([wW]eight:)(\s[0-9a-zA-Z\-\(\)\,\..*]+)(\s+\,)/).join rescue ""
    # item["weight"] = weight.gsub(/([wW]eight:)(\s[0-9a-zA-Z\-\(\)\,\..*]+)(\s+\,)/, '\2').strip rescue ""
    weight = weight.gsub(/([wW]eight:)(\s[0-9a-zA-Z\-\(\)\,\..*]+)(\s+\,)/, '\2').strip rescue ""

    ### Scrape datetime
    # item["scrape_datetime"] = Time.now.strftime("%FT%R:%SZ")
    scrape_datetime = Time.now.strftime("%FT%R:%SZ")

    ### Store
    # item["store"] = "85-89 Yonge Street, Toronto, ONm M5C 1S8"

    ### Extract URL
    query_product = product["handle"]
    # item["url"] = "https://www.staples.ca/products/" + query_product rescue ""
    url = "https://www.staples.ca/products/" + query_product rescue nil

    # pages << {
    #     url: "https://inventory-api-staples-amigos.boldapps.net/v1/inventory/request",
    #     method: "POST",
    #     page_type: "delivery_tor",
    #     headers: {
    #         "Accept" => "application/json, text/plain, */*",
    #         "Accept-Encoding" => "gzip, deflate, br",
    #         "Accept-Language" => "en-US,en;q=0.5",
    #         "Connection" => "keep-alive",
    #         "Content-Type" => "application/json",
    #         "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"
    #     },
    #     body: '{"locale":"en-CA","postal_code":"M5C 1S8","items":[{"sku":"' + sku.to_s + '","quantity":1000}],"location":"M5C 1S8"}',
    #     vars: {
    #         identifier_sku: sku,
    #     }
    # }

    # pages << {
    #     url: "https://inventory-api-staples-amigos.boldapps.net/v1/inventory/request",
    #     method: "POST",
    #     page_type: "delivery_van",
    #     headers: {
    #         "Accept" => "application/json, text/plain, */*",
    #         "Accept-Encoding" => "gzip, deflate, br",
    #         "Accept-Language" => "en-US,en;q=0.5",
    #         "Connection" => "keep-alive",
    #         "Content-Type" => "application/json",
    #         "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"
    #     },
    #     body: '{"locale":"en-CA","postal_code":"V6E 3P3","items":[{"sku":"' + sku.to_s + '","quantity":1000}],"location":"V6E 3P3"}',
    #     vars: {
    #         identifier_sku: sku,
    #     }
    # }

    # outputs << item

    ### Temporary pages
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
            identifier_sku: identifier_sku,
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

end

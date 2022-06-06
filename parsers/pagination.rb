require "json"

json = JSON.parse(content)

products = json["results"][0]["hits"]

total_page_products = products.size



products.each do |product|
    # initialize an empty hash
    item = {}
    
    ### Extract Brand
    item["brand"] = product["named_tags"]["brand"] rescue nil
    
    ### Extract Collection
    item["_collection"] = "items"

    ### Extract Description
    desc_upside = product["body_html"]
    desc_downside = product["meta"]["props"]["bullets"]
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
    features_parse = product["meta"]["props"]["specifications"]
    features_parse = features_parse.gsub(/[\{}\\\"\_]/, " ").gsub(/(en\sCA\s:\s+)/, "").gsub(/(\s+\,\sfr\sCA.*)/, "").strip.gsub(/(\s\d+\s)/, '')
    features = features_parse.split(" ,").join(",")
    item["features"] = features rescue ""

    ### Extract Identifier SKU
    sku = product["sku"]
    item["identifier_sku"] = sku rescue ""

    ### Extract In Stock Instore
    instock_instore = 

    ### Extract In Stock Online
    instock_online = product["in_stock"]
    
    ### Extract Model Number
    model_number = product["_highlightResult"]["named_tags"]["model_num"]["value"]
    item["model_number"] = model_number rescue ""

    ### Extract Product Rating
    product_rating = product["named_tags"]["AverageOverallRating"]
    item["product_rating"] = product_rating rescue ""

    ### Extract Review Count
    review_count = product["named_tags"]["TotalSubmittedReviews"]
    item["review_count"] = review_count rescue ""

    ### Extract Colour
    colour_parse = features.scan(/([cC]olour.*[a-z\-]\,)/).join rescue ""
    colour = colour_parse.gsub(/([cC]olour)(.*\:\s)([a-zA-Z\-]+)(\,)/, '\3') rescue ""
    item["colour"] = colour rescue ""

    ### Extract Size
    item["size"] = ""

    ### Extract Warranty Info
    item["warranty_info"] = ""

    ### Extract Weight
    item["weight"] = ""

    ### Scrape datetime
    item["scrape_datetime"] = Time.now.strftime("%FT%R:%SZ")

    ### Store
    item["store"] = "85-89 Yonge Street, Toronto, ONm M5C 1S8"

    ### Extract URL
    query_product = product["handle"]
    item["url"] = "https://www.staples.ca/products/" + query_product rescue nil

    # pages << {
    #     url: "https://www.staples.ca/products/#{query_product}",
    #     method: "GET",
    #     page_type: "product",
    #     fetch_type: "fullbrowser",
    #     headers: {
    #         "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
    #         "Accept-Encoding" => "gzip, deflate, br",
    #         "Accept-Language" => "en-US,en;q=0.5",
    #         "Connection" => "keep-alive",
    #         # "Cookie" => "_sms_s=205ffdb6-CF34-458D-F1CC-28A9971B6588; _sms_shopify_sa_p=; secure_customer_sig=; localization=CA; cart_currency=CAD; _orig_referrer=https%3A%2F%2Fwww.google.com%2F; _landing_page=%2F; _y=ace79753-2801-4290-82e1-7eae8a29a408; _shopify_y=ace79753-2801-4290-82e1-7eae8a29a408; AlgoliaIDCookie=7956413179548970; rr_session_id=TKK9RVT0J2-L3T2FGIM; ajs_anonymous_id=%225b6e31a2-2da5-4355-84e9-87f14ec29830%22; _ALGOLIA=anonymous-dbd17842-a76e-444d-af0c-5135b5c699d0; _gcl_au=1.1.1240567170.1653935399; __kla_id=e…teStoreCode=CA-234; _clsk=1jb0spk|1654106210935|8|1|www.clarity.ms/eus-d/collect; IR_gbd=staples.ca; IR_10903=1654106204402%7C0%7C1654106204402%7C%7C; _s=205ffdb6-CF34-458D-F1CC-28A9971B6588; _shopify_s=205ffdb6-CF34-458D-F1CC-28A9971B6588; _shopify_sa_t=2022-06-01T17%3A56%3A44.118Z; _shopify_sa_p=; BVImplmain_site=17744; _gat=1; _uetsid=827b7190e04611ecb6d4c534f010b75d; _uetvid=827b97e0e04611eca92ea7e1fa1d6241; BVBRANDID=13439d25-8bf7-4ccc-aa0b-292dbd813f46; BVBRANDSID=198191b4-f354-4275-a7ef-b5ff7455adf2",
    #         "Host" => "www.staples.ca",
    #         "Sec-Fetch-Dest" => "document",
    #         "Sec-Fetch-Mode" => "navigate",
    #         "Sec-Fetch-Site" => "none",
    #         "Sec-Fetch-User" => "?1",
    #         "TE" => "trailers",
    #         "Upgrade-Insecure-Requests" => "1",
    #         "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"
    #     },
    # }

    outputs << item

end

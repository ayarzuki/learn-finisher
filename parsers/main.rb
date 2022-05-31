require "json"

json = JSON.parse(content)

categories = json["data"]["menu"]["listCollection"]["items"]

total_categories = categories.size

categories.each do |category|
    find_sub_categories = category["listCollection"]["items"]
    find_sub_categories.each do |find_sub_category|
        sub_categories = find_sub_category["listCollection"]["items"]
        sub_categories.each do |sub_category|
            url = sub_category["link"]["path"] rescue nil
            encode_url = url.gsub("/", "%2F") rescue nil
            pages << {
                url: "",
                page_type: "sub_category",
                headers: {
                    "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
                    "Accept-Encoding" => "gzip, deflate, br",
                    "Accept-Language" => "en-US,en;q=0.5",
                    "Cookie" => "_sms_s=85e05b26-9f74-46b6-8c5d-80debc898ecc; _sms_shopify_sa_p=; secure_customer_sig=; localization=CA; cart_currency=CAD; favoriteStoreCode=CA-234;",
                }
            }
        end
    end
end

# p sub_category
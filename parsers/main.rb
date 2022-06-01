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
            if url != nil
                url_api = url.gsub("/collections/", "")
                # p url_api
                pages << {
                    url: "https://h5yovykinu-3.algolianet.com/1/indexes/*/queries?x-algolia-agent=Algolia+for+JavaScript+%284.10.5%29%3B+Browser+%28lite%29%3B+JS+Helper+%283.5.5%29%3B+react+%2817.0.2%29%3B+react-instantsearch+%286.12.1%29&x-algolia-api-key=4689de77d9aedbf48bf24a6da6cbebdd&x-algolia-application-id=H5YOVYKINU",
                    page_type: "sub_category",
                    method: "POST",
                    headers: {
                        "Accept" => "*/*",
                        "Accept-Encoding" => "gzip, deflate, br",
                        "Accept-Language" => "en-US,en;q=0.5",
                        "Content-Length" => "384",
                        "Connection" => "keep-alive",
                        "content-type" => "application/x-www-form-urlencoded",
                        "Host" => "h5yovykinu-3.algolianet.com",
                        "Referer" => "https://www.staples.ca/",
                        "Sec-Fetch-Dest" => "empty",
                        "Sec-Fetch-Mode" => "cors",
                        "Sec-Fetch-Site" => "cross-site",
                        "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"
                    },
                    body: '{"requests":[{"indexName":"shopify_products","params":"highlightPreTag=%3Cais-highlight-0000000000%3E&highlightPostTag=%3C%2Fais-highlight-0000000000%3E&getRankingInfo=true&userToken=3235131694945173&clickAnalytics=true&hitsPerPage=32&filters=tags%3A%22en_CA%22%20AND%20collections%3A%22' + url_api + '%22&ruleContexts=%5B%22logged-out%22%5D&page=0"}]}',
                }
            end
        end
    end
end

# p sub_category
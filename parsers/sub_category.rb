json = JSON.parse(content)

total_pages = json["results"][0]["nbPages"] - 1
# url_api = json["results"][0]["hits"][0]["named_tags"]["bc_l3_handle"]

sub_category = page["vars"]["sub_category"]

input = (0..total_pages).to_a.map do |next_page|
    pages << {
        url: "https://h5yovykinu-3.algolianet.com/1/indexes/*/queries?x-algolia-agent=Algolia+for+JavaScript+%284.10.5%29%3B+Browser+%28lite%29%3B+JS+Helper+%283.5.5%29%3B+react+%2817.0.2%29%3B+react-instantsearch+%286.12.1%29&x-algolia-api-key=4689de77d9aedbf48bf24a6da6cbebdd&x-algolia-application-id=H5YOVYKINU",
        page_type: "pagination",
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
        body: '{"requests":[{"indexName":"shopify_products","params":"highlightPreTag=%3Cais-highlight-0000000000%3E&highlightPostTag=%3C%2Fais-highlight-0000000000%3E&getRankingInfo=true&userToken=3235131694945173&clickAnalytics=true&hitsPerPage=32&filters=tags%3A%22en_CA%22%20AND%20collections%3A%22' + sub_category + '%22&ruleContexts=%5B%22logged-out%22%5D&page=' + next_page.to_s + '"}]}',
    }
end
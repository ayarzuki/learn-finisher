headers = {
    "Accept" => "application/json, text/plain, */*",
    "Accept-Encoding" => "gzip, deflate, br",
    "Accept-Language" => "en-US,en;q=0.5",
    "Authorization" => "Bearer eac40ca0b951cff5c097f96a36804ceb1dfebf80dfd1fb7dcf4b75c63fe91880",
    "Connection" => "keep-alive",
    "Origin" => "https://www.staples.ca",
    "Referer" => "https://www.staples.ca/",
    "Sec-Fetch-Dest" => "empty",
    "Sec-Fetch-Mode" => "cors",
    "Sec-Fetch-Site" => "cross-site",
    "TE" => "trailers",
    "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0",
}


pages << {
    url: "https://graphql.contentful.com/content/v1/spaces/2yd1b0rk61ek/environments/master/?query=%7B%0A++++++menu%28id%3A%221jJVW6Qlkqe73D9VVUwma7%22+locale%3A+%22en-CA%22+preview%3A+false%29+%7B%0A++++++++%0A++listCollection%28limit%3A+9%29+%7B%0A++++items+%7B%0A++++++...+on+Menu+%7B%0A++++++++sys+%7B%0A++++++++++id%0A++++++++%7D%0A++++++++title%0A++++++++listCollection%28limit%3A+4%29+%7B%0A++++++++++items+%7B%0A++++++++++++...+on+Menu+%7B%0A++++++++++++++sys+%7B%0A++++++++++++++++id%0A++++++++++++++%7D%0A++++++++++++++title%0A++++++++++++++link+%7B%0A++++++++++++++++...+on+ShopLink+%7B%0A++++++++++++++++++path%0A++++++++++++++++%7D%0A++++++++++++++++...+on+ExternalLink+%7B%0A++++++++++++++++++path%0A++++++++++++++++%7D%0A++++++++++++++%7D%0A++++++++++++++listCollection%28limit%3A+18%29+%7B%0A++++++++++++++++items+%7B%0A++++++++++++++++++...+on+Wrapper+%7B%0A++++++++++++++++++++sys+%7B%0A++++++++++++++++++++++id%0A++++++++++++++++++++%7D%0A++++++++++++++++++++title%0A++++++++++++++++++++thumbnail+%7B%0A++++++++++++++++++++++url%0A++++++++++++++++++++%7D%0A++++++++++++++++++++link+%7B%0A++++++++++++++++++++++...+on+ShopLink+%7B%0A++++++++++++++++++++++++path%0A++++++++++++++++++++++%7D%0A++++++++++++++++++++++...+on+ExternalLink+%7B%0A++++++++++++++++++++++++path%0A++++++++++++++++++++++%7D%0A++++++++++++++++++++%7D%0A++++++++++++++++++%7D%0A++++++++++++++++%7D%0A++++++++++++++%7D%0A++++++++++++%7D%0A++++++++++%7D%0A++++++++%7D%0A++++++%7D%0A++++%7D%0A++%7D%0A++++++%0A++++++%7D%0A++++%7D",
    page_type: "main",
    method: "GET",
    headers: headers
}

### Old Scripts
# pages << {
#     url: "https://www.staples.ca/",
#     headers: {
#         "Accept" => "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8",
#         "Accept-Encoding" => "gzip, deflate, sdch, br",
#         "Accept-Language" => "en-US,en;q=0.5",
#         "Upgrade-Insecure-Requests" => "1",
#         "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:100.0) Gecko/20100101 Firefox/100.0"
#     },
#     page_type: "main",
# }
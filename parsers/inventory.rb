html = Nokogiri.HTML(content)
# p html

title = html.css("h1.product-title").text.strip
p title
class Scraper < ActiveRecord::Base

	def self.decades
		decades = Nokogiri::HTML(open("https://www.goodreads.com/list/show/7"))
		decades.css("div.mediumText a").each do |scrape|
			if scrape.text.include?("Century")
				decade = Decade.new
				decade.name = scrape.text.strip.gsub("Best Books of the ", "")
				decade.url = scrape.attr("href")
				decade.save
			else
				scrape
			end
		end
	Decades.all
	end


	def self.books(link)
		self.scrape(link)
		books = Nokogiri::HTML(open(link))
		@top10books = []

		books.search("tr").each do |this|
		if this.css("td.number").text.to_i <= 10
			libro = BestBooks::Book.new
			libro.ranking = this.css("td.number").text
			libro.title = this.css("a.bookTitle span").text
			libro.link = this.css("a.bookTitle").attr("href").value
			libro.author = this.css(".authorName span").text
			libro.rating = this.css(".minirating").text.strip
				finder = Nokogiri::HTML(open("https://www.goodreads.com" + libro.link))
			libro.description = finder.css("#description span").text
			#libro.decade = BestBooks::Decade.name
			libro
			@top10books.push(libro)
		else
			this
		end
		end
		return @top10books
	end
	end
end

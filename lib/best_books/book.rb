class BestBooks::Book

	attr_accessor :ranking, :title, :link, :author, :rating, :description, :decade

	def initialize
		@@all
		@ranking = ranking
		@title = title
		@link = link
		@author = author
		@rating = rating
		@description = description
		@decade = decade
	end

	def self.scrape(link)
		books = Nokogiri::HTML(open(link))
		@top10books = []

		books.search("tr").each do |this|
		if this.css("td.number").text.to_i <= 10
			libro = BestBooks::Book.new
			libro.ranking = this.css("td.number").text
			libro.title = this.css("a.bookTitle span").text
			libro.link = this.css("a.bookTitle").attr("href")
			libro.author = this.css(".authorName span").text
			libro.rating = this.css(".minirating").text.strip
			#libro.decade = BestBooks::Decade.name
				## descrip = Nokogiri::HTML(open("https://www.goodreads.com" + libro.link))
			## libro.description = descrip.css("div.description span").text
			libro
			@top10books.push(libro)
		else
			this
		end
		end
		return @top10books
	end

	def self.all
		@@all
	end

	def description
		#@@all.each do |descrip|
		#	
		#end
	end
end
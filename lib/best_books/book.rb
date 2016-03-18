class BestBooks::Book

	attr_accessor :ranking, :title, :link, :author, :rating, :description, :decade

	@@all = []

	def initialize
		@ranking = ranking
		@title = title
		@link = link
		@author = author
		@rating = rating
		@description = description
		@decade = decade
		@@all << self
	end

	def self.scrape(link)
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

	def self.all
		@@all
	end

end
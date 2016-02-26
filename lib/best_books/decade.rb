class BestBooks::Decade

	attr_accessor :name, :url, :top10, :decade

	@@all = []

	def initialize
		@name = name
		@url = url
		@top10 = top10
	end

	def self.scraper
			decades = Nokogiri::HTML(open("https://www.goodreads.com/list/show/7"))
			decades.css("div.mediumText a").each do |scrape|
				if scrape.text.include?("Century")
					decade = self.new
					decade.name = scrape.text.strip.gsub("Best Books of the ", "")
					decade.url = scrape.attr("href")
					decade
					@@all << decade
				else
					scrape
				end
			end
		return @@all
	end

	def self.print
		BestBooks::Decade.scraper.each_with_index do |key, i|
			puts "#{i+1}. #{key.name}" if i < 9
			end
	end

	def self.books
		#binding.pry
		@@all.each do |geturl|
			bookscraper = BestBooks::Book.scrape(geturl.url)
			top10 = []
			top10 << bookscraper
			geturl.top10 = top10
		end
		@@all
	end

end
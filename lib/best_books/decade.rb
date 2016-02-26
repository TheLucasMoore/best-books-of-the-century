class BestBooks::Decade

	attr_accessor :name, :url, :top10

	@@all = []

	def initialize
		@name = name
		@url = url
		@top10 = top10
		@@all
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

	def self.save
		
	end

	def self.print
		BestBooks::Decade.scraper.each_with_index do |key, i|
			puts "#{i+1}. #{key.name}" if i < 9
			end
	end

	def top10
		#puts "book.rank - book.title by book.author"
	end

	def self.books
		@@all.each do |url|
			self.url
		end
		binding.pry
	end

end
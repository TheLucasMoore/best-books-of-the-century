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
		@@all
	end

	def self.print
		BestBooks::Decade.scraper.each_with_index do |key, i|
			puts "#{i+1}. #{key.name}" if i < 9
			end
	end

	def self.save
		@@all << self
	end

	def self.all
		@@all
	end


	def self.books
		@@all.each do |geturl|
			bookscraper = BestBooks::Book.scrape(geturl.url)
			top10 = []
			top10 = bookscraper
			geturl.top10 = top10
		end
		@@all
	end

	def self.top10(input)
		BestBooks::Decade.books
		iterate = @@all[input]
			iterate.top10.each do |book|
				puts "#{book.ranking}. #{book.title} by #{book.author}"
		end
	end

	def self.description(input, book_input)
		#BestBooks::Decade.books
		iterate = @@all[input.to_i]
			iterate.top10.each do |book|
		if book.ranking.to_i == book_input
			puts "#{book.ranking} #{book.title} by #{book.author}"
			puts "Rated #{book.rating}"
			puts "#{book.description}"
		else
			puts " "
			end
		end
	end

end


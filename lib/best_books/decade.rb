class BestBooks::Decade

	attr_accessor :name, :url

	@@all = []

def initialize
	@name = name
	@url = url
	@@all
end

def self.scraper
		decades = Nokogiri::HTML(open("https://www.goodreads.com/list/show/7"))
		decades.css("div.mediumText a").each do |scrape|
			#if scrape.text.include?("Century")
				decade = self.new
				decade.name = scrape.text.strip.gsub("Best Books of the", "")
				decade.url = scrape.attr("href")
				decade
				@@all << decade
			end
			#end
		return @@all
end

def self.all
	@@all
end

def self.print
	printme = []
	@@all.each do |name, url|
		if name.@name.include?("century")
			printme << @name
		end
		printme
	end
end

end
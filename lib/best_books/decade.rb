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
	@@all.each_with_index do |key, i|
		puts "#{i}. #{key.name}"
		end
end

end

#[#<BestBooks::Decade:0x007fa56bb3f610
#  @name=" 21st Century",
#  @url="https://www.goodreads.com/list/show/7">,
# #<BestBooks::Decade:0x007fa56bb3f3e0
#  @name=" 20th Century",
#  @url="https://www.goodreads.com/list/show/6">,
# #<BestBooks::Decade:0x007fa56bb3f1d8
#  @name=" 19th Century",
#  @url="https://www.goodreads.com/list/show/16">,
# #<BestBooks::Decade:0x007fa56bb3eff8
#  @name=" 18th Century",
# @url="https://www.goodreads.com/list/show/30">,
# #<BestBooks::Decade:0x007fa56bb3ee18
#  @name=" 17th Century",
#  @url="https://www.goodreads.com/list/show/53">,

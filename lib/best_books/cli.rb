class BestBooks::CLI

	def call
		puts "The Best Books!"
		list_decades
		menu
		goodbye
	end

	def list_decades
		@decade = BestBooks::Decade.print
		@decade
	end

	def menu
		input = nil
		while input != "exit"
			puts "Enter the number of the century for which you want to see the Top Books!"
			puts "Type 'list' to see the centuries again, or type 'exit'"
			input = gets.strip.downcase
			if input.to_i > 0
				puts "Here are the top 10 books of the"
				puts @decade[input.to_i-1].name
				BestBooks::Decade.top10(input.to_i)
			elsif input == "list"
				list_decades
			else
				puts "Not sure what you mean by that. Try 'list' or 'exit'?"
			end
		end
	end

	def goodbye
		puts "Ok, adios. I hope you're reading a book."
	end

end
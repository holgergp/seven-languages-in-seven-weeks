randomNumber=rand(10)
puts "Ich habe mir eine Zahl zwischen 0 und 9 ausgedacht."
puts "Versuche bitte diese Zahl zu raten."
wrongGuess=true
while wrongGuess
	userNumber=gets().to_i
	if userNumber<randomNumber
		puts 'Die Zahl ist zu klein!'
		puts 'Versuche es bitte noch einmal!'
	elsif userNumber>randomNumber
		puts 'Die Zahl ist zu hoch'
		puts 'Versuche es bitte noch einmal!'
	else
		puts "Richtig! Ich habe mir die Zahl: #{randomNumber} ausgedacht!"	
		wrongGuess=false
	end

end

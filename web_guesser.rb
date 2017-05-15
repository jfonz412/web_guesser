require 'sinatra'
require 'sinatra/reloader'

number = rand(100) + 1
@@guesses = 5

get '/' do
  guess = params['guess'].to_i

  message = check_guess(number,guess)
  background = get_background_color(message)

  if @@guesses == 0
  	message = "Took too long! Generating new secret number..." 
    number = rand(100) + 1
    @@guesses = 5
  end

  erb :index, :locals => {:number => number, :message => message, :background => background}
end

def check_guess(number,guess)
  @@guesses -= 1
  if guess > number

    if guess - number > 5
      message = "Way too high!" 
    else
      message = "Too high!"
    end

  elsif guess < number
  	
  	if number - guess > 5
  	  message = "Way too low!" 
  	else
  	  message = "Too low!"
  	end
  	
  else
  	message = "Correct!\nThe secret NUMBER is...#{number}" 
  end
end

def get_background_color(message)
  return "red" if message == "Way too high!" || message == "Way too low!"
  return "blue" if message == "Too high!" || message == "Too low!"
  return "green"
end
require 'sinatra'
require 'sinatra/reloader'

number = rand(100) + 1

get '/' do
  guess = params['guess'].to_i

  if guess > number
  	message = "Too high!"
  	message = "Way too high!" if guess - number > 5
  elsif guess < number
  	message = "Too low!"
  	message = "Way too low!" if number - guess > 5
  else
  	message = "Correct!"
  end

  erb :index, :locals => {:number => number, :message => message}
end

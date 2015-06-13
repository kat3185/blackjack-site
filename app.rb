require 'sinatra'
require 'sinatra/flash'

require_relative 'lib/game'

configure :development, :test do
  require 'pry'
end

use Rack::Session::Cookie, {
  secret: "secret_cookie!"
}

get '/' do
  session[:game] = nil
  session[:player_stands] = false
  erb :index
end

get '/blackjack' do
  if session[:game] == nil
    session[:game] = Game.new(session[:player_name])
    session[:game].deal
  end
  erb :play
end

post '/' do
  session[:player_name] = params[:name]
  redirect '/blackjack'
end

post '/blackjack' do
 if params[:choice] == "Hit"
   session[:game].player_hand.hit!(session[:game].deck.draw!)
   redirect '/blackjack'
 else
   session[:player_stands] = true
   session[:game].dealer_turn
   redirect '/blackjack'
 end
end

get '/scoreboard' do
  erb :scoreboard
end

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

#replace session with hash and make decorate class
get '/blackjack' do
  if session[:game] == nil
    session[:game] = Game.new(session[:player_name])
    session[:game].deal
  end
  erb :play
end

get '/playagain' do
  session[:game] = nil
  session[:player_stands] = false
  redirect '/blackjack'
end

post '/users' do
  session[:player_name] = params[:name]
  redirect '/blackjack'
end

post '/hit' do
  session[:game].player_hand.hit!(session[:game].deck.draw!)
  redirect '/blackjack'
end

post '/stand' do
 session[:player_stands] = true
 session[:game].dealer_turn
 redirect '/blackjack'
end

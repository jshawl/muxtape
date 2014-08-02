require 'rdio'
class UsersController < ApplicationController
  def index
    session
  end
  def show
    rdio = Rdio.new([ENV['RDIO_APP_KEY'], ENV['RDIO_APP_SECRET']],[ session[:token], session[:tokensecret]])
    user = rdio.call('findUser', { vanityName: params[:user] })
    key = user['result']['key']
    puts "**KEY:"
    puts key
    @playlists = rdio.call('getUserPlaylists', {'user'=> key })
    @playlists = @playlists["result"]
  end
end

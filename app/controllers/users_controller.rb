require 'rdio'
class UsersController < ApplicationController
  def index
    session
    rdio = Rdio.new([ENV['RDIO_APP_KEY'], ENV['RDIO_APP_SECRET']],[ session[:token], session[:tokensecret]])
    @playlists = rdio.call('getPlaylists')["result"]["owned"]
  end
  def show
    puts params.inspect
  end
end

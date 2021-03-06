require 'rdio'
class UsersController < ApplicationController
  def index
    session
  end
  def show
    rdio = Rdio.new([ENV['RDIO_APP_KEY'], ENV['RDIO_APP_SECRET']])
    user = rdio.call('findUser', { vanityName: params[:user] })
    key = user['result']['key']
    puts "**KEY:"
    puts key
    @playlists = rdio.call('getUserPlaylists', {'user'=> key })
    @playlists = @playlists["result"]
    @friends = rdio.call('userFollowing', {'user'=> key })
    @friends = @friends["result"]
  end
end
